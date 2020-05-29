class CartController < ApplicationController
	skip_before_action :ensure_login_dealer, only: [:new, :create, :index, :update]
	def index
		@cart = current_user().cart
	end

	def create
		@user_using = Customer.find_by(id: params[:customer_id])
		redirect_to cart_index_path
	end

	def update
		@product = Product.find_by(id: params[:id])
		@carttosave = Cart.new
		@carttosave.customer_id = current_user.id
		@carttosave.product_id = @product.id
		@carttosave.quantity = 1
		@carttosave.save
		redirect_to cart_index_path
	end
end
