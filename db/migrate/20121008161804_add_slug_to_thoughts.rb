class AddSlugToThoughts < ActiveRecord::Migration
  def change
    add_column :thoughts, :slug, :string, unique: true
    add_index :thoughts, :slug
  end
end
