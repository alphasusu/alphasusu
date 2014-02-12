class SessionsController < Devise::SessionsController
	
	def new
		self.resource = User.new
	end
	
	def create
		# We need to determine if we will use LDAP or the Database to auth a user.
		# To do this, we're going to inspect the email address provided.
		email = request.params['user']['email']

		# Remove @soton.ac.uk or equivalent, force uni addresses to auth with LDAP
		if email.end_with? Rails.application.config.ldap_email
			email.sub! "@#{Rails.application.config.ldap_email}", ""
		end
		
		# Now switch on whether there is an @ in the 'email'
		# It might not be an email, it might be an AD username, but Devise likes
		# things to be emails.
		user_class = nil
		error_string = 'Login failed'
		if email.include? '@'
			user_class = :local_user
			error_string = 'SUSU username or password incorrect'
		else
			user_class = :ldap_user
			error_string = 'University username or password incorrect'
		end
		
		# Copy user data to ldap_user and local_user, which Devise is expecting
		request.params['ldap_user'] = request.params['local_user'] = request.params['user']
		
		# Use Warden to authenticate the user, if we get nil back, it failed.
		self.resource = warden.authenticate scope: user_class
		if self.resource.nil?
			flash[:error] = error_string
			return redirect_to new_session_path
		end
		
		# Now we know the user is authenticated, sign them in to the site with Devise
		sign_in(user_class, self.resource)
		
		# ... and redirect them to where they need to go.
		respond_with self.resource, :location => after_sign_in_path_for(self.resource)
	end
	
	def destroy
		if sign_out && is_navigational_format?
			flash[:notice] = "Signed out"	
		end
		
		respond_to do |format|
			format.all { head :no_content }
			format.any(*navigational_formats) { redirect_to root_path }
		end
	end
	
end