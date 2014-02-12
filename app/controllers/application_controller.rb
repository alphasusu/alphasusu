class ApplicationController < ActionController::Base
  
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  check_authorization :unless => :in_unauthorized_whitelist?

  before_filter :check_first_run
  before_filter :set_site_area
  before_filter :mailer_set_url_options

  before_filter :configure_allowed_devise_parameters, if: :devise_controller?

  helper_method :current_user, :logged_in?

  def current_user
    if current_ldap_user
      current_ldap_user
    elsif current_local_user
      current_local_user
    else
      nil
    end
  end
  
  def logged_in?
    current_user != nil
  end

private

  def check_first_run
    if not cookies.permanent[:returning_user]
      @first_visit = true
      cookies.permanent[:returning_user] = true
    end
  end
  
  def set_site_area
    params[:site_area] = :generic
  end

  def in_unauthorized_whitelist?
    respond_to?(:devise_controller?)
  end
  
  # For Debugging, set the host for emailed links dynamically
  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
  
  def configure_allowed_devise_parameters
    # Strong Parameters in Rails 4 means that we can't just use attr_accessible to
    # whitelist model parameters. We need extra parameters on reigstration (name)
    # so we whitelist them here.
    devise_parameter_sanitizer.for(:sign_up).push(:first_name, :last_name)
    devise_parameter_sanitizer.for(:account_update).push(:first_name, :last_name, :avatar)
  end
  
  def require_login
    if not current_user
      redirect_to :new_session, alert: "You must be logged in to view this page."
      false
    else
      true
    end
  end


  # Helper methods for resource controllers to re-use similar code

  def create_resource_response(resource)
    respond_to do |format|
      if resource.save
        format.html { redirect_to resource, notice: "#{resource.class.name.titlecase} was successfully created." }
        format.json { render action: 'show', status: :created, location: resource }
      else
        resource_response_error(resource, :new, format)
      end
    end
  end

  def update_resource_response(resource, parameters)
    respond_to do |format|
      if resource.update(parameters)
        format.html { redirect_to resource, notice: "#{resource.class.name.titlecase} was successfully updated." }
        format.json { head :no_content }
      else
        resource_response_error(resource, :edit, format)
      end
    end
  end

  def resource_response_error(resource, action, format)
    format.html { render action: action.to_s }
    format.json { render json: resource.errors, status: :unprocessable_entity }
  end

end
