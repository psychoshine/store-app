class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :fb
      t.string :insta
      t.string :vk
      t.string :phone
      t.string :phone2
      t.string :phone3
      t.text :description
      t.text :description2
      t.string :adress
      t.string :adress2
      t.string :twitter
      t.string :email
      t.text :how_to_get
      t.text :how_to_get2

      t.timestamps
    end
  end
end
