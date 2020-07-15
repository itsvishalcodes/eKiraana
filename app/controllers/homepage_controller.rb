class HomepageController < ApplicationController
	skip_before_action :ensure_login_user
	skip_before_action :ensure_login_dealer
  skip_before_action :ensure_login_delboy
  def index
  	if params[:search].blank?
  		redirect_to homepagews_path
  	else
  		@parameter = params[:search].downcase
  		# @allproducts = Product.all.where("lower(tags) LIKE :search", search: "%#{@parameter}%")
      if logged_in?  
        @allproducts = Dealerpersonalinfo.find_by(pincode: current_user.customerpersonalinfo.pincode).dealer.products.where("lower(tags) LIKE :search", search: "%#{@parameter}%")
      else 
        @allproducts = Product.all.where("lower(tags) LIKE :search", search: "%#{@parameter}%")
      end
    end
  end

  def indexws
  end

  def checkaval
    @result = false
    @pincode = params[:pincode]
    if Dealerpersonalinfo.find_by(pincode: @pincode)
      @result = true
    end
    respond_to do |format|
      format.js
    end
  end
end
