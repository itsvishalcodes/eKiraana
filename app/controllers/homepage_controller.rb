class HomepageController < ApplicationController
	skip_before_action :ensure_login_user, only: [:index]
	skip_before_action :ensure_login_dealer, only: [:index]
  def index
  	@allproducts = Product.all
  end
end
