class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :category_id
      t.string :title
      t.text :review
      t.float :evaluation
      t.string :device_image_id

      t.timestamps
    end
  end
end
