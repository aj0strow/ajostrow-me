class AddSlugToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :slug, :string, unique: true
    add_index :projects, :slug
  end
end
