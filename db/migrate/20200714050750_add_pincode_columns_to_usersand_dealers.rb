class AddPincodeColumnsToUsersandDealers < ActiveRecord::Migration[6.0]
  def change
  	add_column :customerpersonalinfos, :pincode, :integer
  	add_column :dealerpersonalinfos, :pincode, :integer
  end
end
