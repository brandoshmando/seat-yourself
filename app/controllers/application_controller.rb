class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def ensure_logged_in
  	unless current_user
  		flash[:alert] = "Please logg in"
  		redirect_to root_path
  	end

  	private

  	def current_customer
  		@current_customer ||= User.find(session[:customer_id]) if session[:customer_id]
  	end

  	helper_method = :current_customer
end
