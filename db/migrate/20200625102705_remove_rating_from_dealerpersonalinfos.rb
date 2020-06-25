class RemoveRatingFromDealerpersonalinfos < ActiveRecord::Migration[6.0]
  def change
    remove_column :dealerpersonalinfos, :rating, :integer
  end
end
