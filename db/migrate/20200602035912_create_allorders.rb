class CreateAllorders < ActiveRecord::Migration[6.0]
  def change
    create_table :allorders do |t|
      t.integer :quantity
      t.references :product, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
