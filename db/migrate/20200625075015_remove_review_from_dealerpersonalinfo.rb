class RemoveReviewFromDealerpersonalinfo < ActiveRecord::Migration[6.0]
  def change
    remove_column :dealerpersonalinfos, :Review, :string
  end
end
