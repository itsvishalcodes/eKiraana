class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :ensure_login
	helper_method :logged_in?, :current_user

	protected
	def ensure_login
		redirect_to login_path unless session[:customer_id]
	end

	def logged_in?
		session[:customer_id]
	end

	def current_user
		@current_user ||= Customer.find(session[:customer_id])
	end
end
