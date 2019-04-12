class CreateDealTags < ActiveRecord::Migration[5.2]
  def change
    create_table :deal_tags do |t|
      t.references :deal, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
