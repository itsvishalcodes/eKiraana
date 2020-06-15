class CartController < ApplicationController
	skip_before_action :ensure_login_dealer
	skip_before_action :ensure_login_delboy
	def index
		@cart = current_user().cart
	end


	def update
		@product = Product.find_by(id: params[:id])
		@carttosave = Cart.new
		@carttosave.product_id = @product.id
		if current_user.cart.find_by(product_id: @carttosave.product_id) != nil
			current_user.cart.find_by(product_id: @carttosave.product_id).update!(:quantity => current_user.cart.find_by(product_id: @carttosave.product_id).quantity+1)
		else
			@carttosave.customer_id = current_user.id
			# @carttosave.product_id = @product.id
			@carttosave.quantity = 1
			@carttosave.save
		end
		respond_to do |format|
			format.js
		end
	end
end
