class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :event, index: true
      t.references :event_user, index: true
      t.text :description
      t.string :name
      t.timestamps

      t.index [:event_id, :event_user_id]
    end
  end
end
