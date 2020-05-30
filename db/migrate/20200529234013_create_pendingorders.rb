class CreatePendingorders < ActiveRecord::Migration[6.0]
  def change
    create_table :pendingorders do |t|
      t.integer :quantity
      t.string :confkey
      t.references :product, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
