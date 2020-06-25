class RemoveRatingFromDealerpersonalinfo < ActiveRecord::Migration[6.0]
  def change
    remove_column :dealerpersonalinfos, :Rating, :integer
  end
end
