class CreateUserTroubles < ActiveRecord::Migration[5.2]
  def change
    create_table :user_troubles do |t|
      t.references :user, foreign_key: true
      t.references :trouble, foreign_key: true

      t.timestamps
    end
  end
end
