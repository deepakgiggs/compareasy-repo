class CreateSearchProducts < ActiveRecord::Migration
  def change
    create_table :search_products do |t|
       t.string   "product_id"
       t.string   "product_title"
       t.string   "product_owner"
       t.string   "product_url"
       t.string   "product_categories", array: true
       t.string   "product_image"
       t.string   "product_description"
       t.string   "product_retail_price"
       t.string   "product_selling_price"
       t.string   "product_brand"
       t.string   "product_color"

      t.timestamps null: false
    end
  end
end
