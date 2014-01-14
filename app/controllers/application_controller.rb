class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  check_authorization

  before_filter :check_first_run

  def check_first_run
    if not cookies.permanent[:returning_user]
      @first_visit = true
      cookies.permanent[:returning_user] = true
    end
  end

  def current_user
    return current_ldap_user | current_local_user | nil
  end

end
