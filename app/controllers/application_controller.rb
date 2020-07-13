class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception

	before_action :ensure_login_user
	before_action :ensure_login_dealer
	before_action :ensure_login_delboy
	helper_method :logged_in?, :logged_in_dealer?, :current_user, :current_dealer, :cart_count

	def cart_count
		if session[:customer_id]
			Cart.where(customer_id: current_user.id).sum(:quantity)
		else
			0
		end
	end

	protected
	def ensure_login_user
		redirect_to login_path unless session[:customer_id]
	end

	def ensure_login_dealer
		redirect_to dealerlogin_path unless session[:dealer_id]
	end

	def ensure_login_delboy
		redirect_to delboysession_new_path unless session[:delboy_id]
	end

	def logged_in?
		session[:customer_id]
	end

	def logged_in_dealer?
		session[:dealer_id]
	end

	def current_user
		@current_user ||= Customer.find(session[:customer_id])
	end

	def current_dealer
		@current_dealer ||= Dealer.find(session[:dealer_id])
	end

end
