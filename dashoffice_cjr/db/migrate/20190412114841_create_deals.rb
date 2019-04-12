class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.references :customer, foreign_key: true
      t.string :name
      t.text :description
      t.references :primary_seller
      t.references :secondary_seller
      t.date :start_date
      t.boolean :active
      t.boolean :done
      t.float :price
      t.timestamps
    end
    add_foreign_key :deals, :users, column: :primary_seller_id, primary_key: :id
    add_foreign_key :deals, :users, column: :secondary_seller_id, primary_key: :id
  end
end