class CreateCartConfirms < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_confirms do |t|
      t.integer :shopping_cart_id

      t.timestamps
    end
  end
end
