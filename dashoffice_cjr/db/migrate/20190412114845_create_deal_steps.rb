class CreateDealSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :deal_steps do |t|
      t.references :step, foreign_key: true
      t.references :deal, foreign_key: true
      t.date :entry_date
      t.date :conclusion_date

      t.timestamps
    end
  end
end
