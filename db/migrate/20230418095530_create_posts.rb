class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :image_url
      t.integer :likes
      t.integer :status
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
