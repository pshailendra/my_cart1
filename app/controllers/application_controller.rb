class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :current_cart
  def current_cart
    @current_cart ||= Cart.find(session[:cart_id]) unless session[:cart_id].nil?
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  end

  def login_required
    redirect_to new_session_path, :notice => 'Login Required....!' if session[:user_id].nil?
  end

  #def current_user
  #  @current_user ||= User.find(session[:user_id]) unless session[:user_id].nil?
  #end
end
