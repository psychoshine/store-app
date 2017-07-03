class AddCitiesToShoppingContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :shopping_contacts, :city, :string
  end
end
