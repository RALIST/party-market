class CreateEventUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :event_users do |t|
      t.references :event, index: true
      t.references :user, index: true
      t.timestamps
    end

    add_index :event_users, [:user_id, :event_id]
  end
end
