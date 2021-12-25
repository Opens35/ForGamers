class CreateBlogs < ActiveRecord::Migration[5.2]
  def change
    create_table :blogs do |t|
      t.integer :category_id
      t.string :title
      t.text :review
      t.float :rating
      t.string :device_image

      t.timestamps
    end
  end
end
