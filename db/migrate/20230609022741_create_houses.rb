class CreateHouses < ActiveRecord::Migration[6.0]
  def change
    create_table :houses do |t|
      t.string :house_name
      t.integer :price
      t.string :address
      t.integer :age
      t.text :note
      t.timestamps
    end
  end
end
