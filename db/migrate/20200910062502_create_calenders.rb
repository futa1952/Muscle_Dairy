class CreateCalenders < ActiveRecord::Migration[5.2]
  def change
    create_table :calenders do |t|
      t.integer :user_id
      t.string :title, null: false
      t.text :body, null: false
      t.boolean :disp_flg
      t.datetime :start
      t.datetime :end
      t.string :allDay, null: false

      t.timestamps
    end
  end
end
