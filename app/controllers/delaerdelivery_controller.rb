class DelaerdeliveryController < ApplicationController
  skip_before_action :ensure_login_user
  def index
  	@allptd = current_dealer.ptd.group(:customer_id).count
  end

  def show
  	@key = params[:id]
  	@allptdbc = current_dealer.ptd.where(customer_id: params[:id])
  end
end
