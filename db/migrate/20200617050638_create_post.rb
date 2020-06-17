class CreatePost < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :header
      t.string :content
      t.text :hash_tags, array: true, default: []

    end
  end
end
