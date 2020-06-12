class CheckoutController < ApplicationController
	skip_before_action :ensure_login_dealer
	def index
		@allpending = Pendingorder.where(customer_id: current_user.id)
	end
	def create
		@randomstr = (0...8).map { ('a'..'z').to_a[rand(26)] }.join
		@topending = current_user.cart
		@topending.each do |toadd|
			@toaddco = Pendingorder.new
			@toaddco.confkey = @randomstr
			@toaddco.product_id = toadd.product_id
			@toaddco.customer_id = toadd.customer_id
			@toaddco.quantity = toadd.quantity
			@toaddco.save
		end
		current_user.cart.destroy_all
		flash['Notification'] = "Thankyou for Shopping with us... Your order will reach you within 30 minutes! \n :)"
		redirect_to root_path
	end
end
