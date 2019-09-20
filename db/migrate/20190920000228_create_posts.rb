class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.integer :user_id
      t.text :content, null: false

      t.timestamps
    end
  end
end
