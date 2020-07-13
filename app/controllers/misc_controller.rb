class MiscController < ApplicationController
	skip_before_action :ensure_login_dealer, only: [:pendingorder_user, :allorder_user, :delboypendings, :delboypendingsbc, :delboyconfdel, :pendingorder_userbc, :editaddress, :editaddress_form]
	skip_before_action :ensure_login_delboy, only: [:pendingorder_user, :allorder_user, :pendingorder_userbc, :editaddress, :editaddress_form]

	skip_before_action :ensure_login_user, only: [:delboypendings, :delboypendingsbc, :delboyconfdel]
	
	def pendingorder_user
		@allpo = Pendingorder.where(customer_id: current_user.id).group(:confkey).count
	end

	def pendingorder_userbc
		@key = params[:configkey]
		@pendingsbc = Pendingorder.where(customer_id: current_user.id).where(confkey: @key)
	end
	
	def allorder_user
		@allo = Allorder.where(customer_id: current_user.id).group(:created_at).count
	end

	def delboypendings
		@allptd = Pendingorder.group(:customer_id).count
	end

	def delboypendingsbc
		@customer = params[:id]
		@price = 0
		@allptdbc = Pendingorder.where(customer_id: @customer)
	end

	def delboyconfdel
		@conf = params[:conf_key]
		@todesandadd = Pendingorder.where(confkey: @conf)
		@todesandadd.each do |toaddanddes|
  			@toaddo = Allorder.new
  			@toaddo.quantity = toaddanddes.quantity
  			@toaddo.product_id = toaddanddes.product_id
  			@toaddo.customer_id = toaddanddes.customer_id
  			@toaddo.save
  			# @toaddanddes.destroy
  		end
  		@todesandadd.destroy_all
  		flash['Notification'] = 'Delivered'
  		redirect_to delboy_pendings_path
	end

	def editaddress_form 

	end

	def editaddress 
		current_user.customerpersonalinfo.update!(:name => params[:name])
		current_user.customerpersonalinfo.update!(:phone => params[:phone])
		current_user.customerpersonalinfo.update!(:address => params[:address])
		flash['Notification'] = 'Personal Info updated'
		redirect_to home_page_path
	end

	
end
