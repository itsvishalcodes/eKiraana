class CartController < ApplicationController
	skip_before_action :ensure_login_dealer
	skip_before_action :ensure_login_delboy
	def index
		@price = 0
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

	def cartminus
		@productquan
		@product = Product.find(params[:id])
		@carttodel = Cart.find_by(product_id: @product.id)
		if current_user.cart.find_by(product_id: @carttodel.product_id).quantity == 1
			@carttodel.destroy
			@productquan = 0
		else
			current_user.cart.find_by(product_id: @carttodel.product_id).update!(:quantity => current_user.cart.find_by(product_id: @carttodel.product_id).quantity-1)
			@productquan = current_user.cart.find_by(product_id: params[:id]).quantity
		end
		respond_to do |format|
			format.js
		end
	end
end
