class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.string :facebook_uid
      t.text :content

      t.timestamps
    end
  end
end
