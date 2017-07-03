class AddFullNamesToShoppingContact < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_contacts, :full_name, :string
  end
end
