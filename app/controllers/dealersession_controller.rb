class DealersessionController < ApplicationController
	skip_before_action :ensure_login_user, only: [:new, :create, :destroy]
  
  skip_before_action :ensure_login_delboy
  skip_before_action :ensure_login_dealer, only: [:new, :create]
  def new
  end

  def create
  	current_dealer = Dealer.find_by(email: params[:dealer][:email])
  	dealer_password = params[:dealer][:password]

  	if current_dealer && current_dealer.authenticate(dealer_password)
  		session[:dealer_id] = current_dealer.id
      if current_dealer.dealerpersonalinfo != nil
  		  redirect_to products_path, notice: "Logged In"
      else
        redirect_to new_dealerpersonalinfo_path, alert: "Please fill details"
      end
  	else 
  		redirect_to dealerlogin_path, alert: "Oops! Wrong Credentials for Dealer"
  	end
  end

  def destroy
  	reset_session
  	redirect_to dealerlogin_path, notice: "You have been logged out"
  end
end
