class RemovingPrecisionFromAllorders < ActiveRecord::Migration[6.0]
  def change
  	change_column :allorders, :created_at, :datetime, :precision => 0
  	change_column :allorders, :updated_at, :datetime, :precision => 0
  end
end
