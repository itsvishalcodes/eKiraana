class RemoveReviewFromDealerpersonalinfos < ActiveRecord::Migration[6.0]
  def change
    remove_column :dealerpersonalinfos, :review, :string
  end
end
