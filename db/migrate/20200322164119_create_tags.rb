class CreateTags < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.integer :resource_id
      t.string :resource_type
      t.string :key
      t.timestamps
      t.index [:resource_id, :resource_type]
    end
  end
end
