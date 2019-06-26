class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
end

def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
end

def logged_in?
  !!current_user
end

def require_user
  if !logged_in?
    flash[:error] = "you have to be login before continue this one"
    redirect_to login_path
  end  
end
