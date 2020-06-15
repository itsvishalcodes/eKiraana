class HomepageController < ApplicationController
	skip_before_action :ensure_login_user
	skip_before_action :ensure_login_dealer
  skip_before_action :ensure_login_delboy
  def index
  	if params[:search].blank?
  		@allproducts = Product.all
  	else
  		@parameter = params[:search].downcase
  		@allproducts = Product.all.where("lower(tags) LIKE :search", search: "%#{@parameter}%")
  	end
  end
end
