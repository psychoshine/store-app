class CreateMainShots < ActiveRecord::Migration[5.0]
  def change
    create_table :main_shots do |t|
      t.string :title
      t.text :description
      t.text :description2
      t.string :title2

      t.timestamps
    end
  end
end
