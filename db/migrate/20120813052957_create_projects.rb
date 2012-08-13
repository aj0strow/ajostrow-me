class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.datetime :finished_at
      t.string :name
      t.string :blurb
      t.text :description
      t.string :project_url
      t.string :code_url
      t.string :language

      t.timestamps
    end
  end
end
