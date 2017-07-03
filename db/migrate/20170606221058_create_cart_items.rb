class CreateCartItems < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_items do |t|
      t.integer :shop_item_id
      t.integer :quantity, default: 1
      t.integer :shopping_cart_id
      t.decimal :shop_price,  :precision => 12, :scale => 2

      t.timestamps
    end
  end
end
