class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.integer :capicity
      t.float :price
      t.string :loc_type
      t.text :description
      t.string :city
      t.string :address
      t.string :slug, uniq: true
      t.string :name
      t.timestamps
    end
  end
end
