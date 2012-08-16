class CreateThoughts < ActiveRecord::Migration
  def change
    create_table :thoughts do |t|
      t.string :title
      t.string :blurb
      t.text :content
      t.string :author

      t.timestamps
    end
  end
end
