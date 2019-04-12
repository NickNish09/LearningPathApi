class CreateProjectDevelopers < ActiveRecord::Migration[5.2]
  def change
    create_table :project_developers do |t|
      t.references :project, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :project_manager

      t.timestamps
    end
  end
end
