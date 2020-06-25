class ChangePhoneToBeStringInDealerpersonalinfos < ActiveRecord::Migration[6.0]
  def change
  	change_column :dealerpersonalinfos, :phone, :string
  end
end
