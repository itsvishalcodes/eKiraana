class MiscController < ApplicationController
	skip_before_action :ensure_login_dealer, only: [:pendingorder_user, :allorder_user]
	def pendingorder_user
		@allpo = Pendingorder.where(customer_id: current_user.id)
	end
	
	def allorder_user
		@allo = Allorder.where(customer_id: current_user.id)
	end

	def delboypendings
		
	end

	def delboypendingsbc
		
	end
end
