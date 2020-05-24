class DealersessionController < ApplicationController
	skip_before_action :ensure_login, only: [:new, :create]
  def new
  end

  def create
  	current_dealer = Dealer.find_by(email: params[:dealer][:email])
  	dealer_password = params[:dealer][:password]

  	if current_dealer && current_dealer.authenticate(dealer_password)
  		session[:dealer_id] = current_dealer.id
  		redirect_to root_path, notice: "Logged In"
  	else 
  		redirect_to login_path, alert: "Oops! Wrong Credentials"
  	end
  end

  def destroy
  	reset_session
  	
  end
end
