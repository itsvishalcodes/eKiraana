class CustomersessionController < ApplicationController
  skip_before_action :ensure_login, only: [:new, :create]
  def new
  end

  def create
  	current_user = Customer.find_by(email: params[:customer][:email])
  	password = params[:customer][:password]

  	if current_user && current_user.authenticate(password)
  		session[:customer_id] = current_user.id
  		redirect_to root_path, notice: "Logged In"
  	else 
  		redirect_to login_path, alert: "Oops! Wrong Credentials"
  	end
  end

  def destroy
  	reset session
  	redirect_to login_path, notice: "You have been logged out"
  end
end
