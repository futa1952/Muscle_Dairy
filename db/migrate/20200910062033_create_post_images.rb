class CreatePostImages < ActiveRecord::Migration[5.2]
  def change
    create_table :post_images do |t|
      t.string :image_id
      t.text :menu, null: false
      t.integer :user_id
      t.string :title, null: false

      t.timestamps
    end
  end
end
