class CreateShoppingContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :shopping_contacts do |t|
      t.integer :shopping_cart_id
      t.integer :user_id
      t.string :state
      t.integer :zip_code
      t.string :adress
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
