class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    unless session[:user_id]
      flash[:errors] = ["You must login first"]
      redirect_to root_path
    end
  end
end
