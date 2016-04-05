class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :update_manifiest

  def update_manifiest
    File.open('public/offline.appcache', 'a') { |f| f.write('#') }
  end

  protected
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find_by_id(session[:user_id])
  end


  def authenticate
    logged_in? || access_denied
  end

  def logged_in?
    current_user.is_a? User
  end

  def access_denied
    flash[:notice] = "Por favor, inicie sesión"
    redirect_to root_url
    return false
  end
end
