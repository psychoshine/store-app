class CreateShopItems < ActiveRecord::Migration[5.0]
  def change
    create_table :shop_items do |t|
      t.string :title1
      t.string :title2
      t.text :description1
      t.text :description2
      t.decimal :price, :precision => 12, :scale => 2

      t.timestamps
    end
  end
end
