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
		redirect_to cart_index_path
	end
end
