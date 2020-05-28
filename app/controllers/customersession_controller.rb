class CustomersessionController < ApplicationController
  skip_before_action :ensure_login_user, only: [:new, :create]
  skip_before_action :ensure_login_dealer, only: [:new, :create]
  def new
  end

  def create
  	current_user = Customer.find_by(email: params[:customer][:email])
  	password = params[:customer][:password]

  	if current_user && current_user.authenticate(password)
  		session[:customer_id] = current_user.id
      if current_user.customerpersonalinfo != nil
  		  redirect_to root_path, notice: "Logged In"
      else
        redirect_to new_customerpersonalinfo_path, alert: "Incomplete Profile! Fill all the details"
      end
  	else 
  		redirect_to login_path, alert: "Oops! Wrong Credentials for customer"
  	end
  end

  def destroy
  	reset_session
  	redirect_to login_path, notice: "You have been logged out"
  end
end
