class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.string :name
      t.integer :deadline

      t.timestamps
    end
  end
end
