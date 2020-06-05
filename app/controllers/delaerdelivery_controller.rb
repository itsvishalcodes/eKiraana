class DelaerdeliveryController < ApplicationController
  skip_before_action :ensure_login_user
  def index
  	@allptd = current_dealer.ptd.group(:customer_id).count
  end

  def show
  	@key = params[:id]
  	@allptdbc = current_dealer.ptd.where(customer_id: params[:id])
  end

  def conf
  	if params[:conf_key].blank?  
    	redirect_to(root_path, alert: "Empty field!") and return  
  	else 
  		@todesandadd = current_dealer.ptd.where(confkey: params[:conf_key])
  		@todesandadd.each do |toaddanddes|
  			@toaddo = Allorder.new
  			@toaddo.quantity = toaddanddes.quantity
  			@toaddo.product_id = toaddanddes.product_id
  			@toaddo.customer_id = toaddanddes.customer_id
  			@toaddo.save
  			# @toaddanddes.destroy
  		end
  		@todesandadd.destroy_all
  		# current_dealer.ptd.where(customer_id: params[:id]).destroy
 	end
 end
end
