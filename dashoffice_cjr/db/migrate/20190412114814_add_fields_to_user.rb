class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :admin, :boolean
    add_reference :users, :role, foreign_key: true
    add_reference :users, :core, foreign_key: true
    add_column :users, :active, :boolean
  end
end
