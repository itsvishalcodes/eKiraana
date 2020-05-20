class CreateDealerpersonalinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :dealerpersonalinfos do |t|
      t.string :shopname
      t.integer :rating
      t.integer :phone
      t.string :review
      t.references :dealer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
