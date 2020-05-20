class CreateCustomerpersonalinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :customerpersonalinfos do |t|
      t.string :name
      t.string :phone
      t.string :address
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
