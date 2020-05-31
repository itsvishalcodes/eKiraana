class CartController < ApplicationController
	skip_before_action :ensure_login_dealer, only: [:new, :create, :index, :update]
	def index
		@cart = current_user().cart
	end


	def update
		@product = Product.find_by(id: params[:id])
		@carttosave = Cart.new
		@carttosave.product_id = @product.id
		if Cart.find_by(product_id: @carttosave.product_id) != nil
			Cart.find_by(product_id: @carttosave.product_id).update!(:quantity => Cart.find_by(product_id: @carttosave.product_id).quantity+1)
		else
			@carttosave.customer_id = current_user.id
			# @carttosave.product_id = @product.id
			@carttosave.quantity = 1
			@carttosave.save
		end
	end
end
