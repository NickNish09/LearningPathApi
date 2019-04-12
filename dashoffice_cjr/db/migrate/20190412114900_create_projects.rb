class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.float :price
      t.references :customer, foreign_key: true
      t.date :start_date
      t.date :conclusion_date
      t.boolean :open_scope
      t.integer :sprints

      t.timestamps
    end
  end
end
