class CreateProjectRequirements < ActiveRecord::Migration[5.2]
  def change
    create_table :project_requirements do |t|
      t.references :project, foreign_key: true
      t.references :requirement, foreign_key: true

      t.timestamps
    end
  end
end
