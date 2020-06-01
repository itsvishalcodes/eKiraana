class DelaerdeliveryController < ApplicationController
  skip_before_action :ensure_login_user
  def index
  	@allptd = current_dealer.ptd
  end

  def update
  end
end
