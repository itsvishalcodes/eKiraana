class HomepageController < ApplicationController
  def index
  	@allproducts = Product.all
  end
end
