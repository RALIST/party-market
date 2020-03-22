class CreateMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :marks do |t|
      t.references :image, index: true
      t.references :event_user, index: true
      t.integer :actor_id, index: true
      t.integer :actor_type, index: true
      t.text :name
      t.text :description
      t.timestamps

      t.index [:actor_id, :actor_type]
      t.index [:image_id, :event_user_id]
    end
  end
end
