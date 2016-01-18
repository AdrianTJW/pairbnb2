class ApplicationController < ActionController::Base
  include Clearance::Controller
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # def current_user1
  #   @current_user1 ||= User.find(session[:user_id]) if session[:user_id]
  # end
  # helper_method :current_user1
end
