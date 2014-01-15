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

  def check_first_run
    if not cookies.permanent[:returning_user]
      @first_visit = true
      cookies.permanent[:returning_user] = true
    end
  end
  
  def set_site_area
    params[:site_area] = :generic
  end

  def current_user
    return current_ldap_user | current_local_user | nil
  end

private

  def in_unauthorized_whitelist?
    respond_to?(:devise_controller?)
  end

end
