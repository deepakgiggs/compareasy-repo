class CreateSearchProducts < ActiveRecord::Migration
  def change
    create_table :search_products do |t|
      t.string :product_id
      t.string :product_title
      t.string :product_site
      t.string :product_image
      t.string :product_link
      t.string :product_price
      t.string :product_discount
      t.string :product_details

      t.timestamps null: false
    end
  end
end
