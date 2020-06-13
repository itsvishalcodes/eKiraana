class DelboysessionController < ApplicationController
  skip_before_action :ensure_login_user, only: [:new, :create, :destroy]
  skip_before_action :ensure_login_dealer, only: [:new, :create, :destroy]
  skip_before_action :ensure_login_delboy, only: [:new, :create]


  def new
  end

  def create
  	current_delboy = Delboy.find_by(email: params[:email])
  	password = params[:password]

  	if current_delboy && current_delboy.authenticate(password)
  		session[:delboy_id] = current_delboy.id
  		flash["Notification"] = "Logged In"
  		redirect_to delboy_pendings_path
  	else
  		flash['Notification'] = "Wrong Credentials"
  		redirect_to delboysession_new_path
  	end
  end

  def destroy
    reset_session
    flash['Notification'] = "Logged Out"
    redirect_to delboysession_new_path
  end
end
