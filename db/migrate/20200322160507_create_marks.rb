class CreateMarks < ActiveRecord::Migration[6.0]
  def change
    create_table :marks do |t|
      t.references :image, index: true
      t.references :event_user, index: true
      t.references :actor, index: true
      t.text :name
      t.text :description
      t.timestamps
      t.index [:image_id, :event_user_id]
    end
  end
end
