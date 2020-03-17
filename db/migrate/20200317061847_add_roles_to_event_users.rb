class AddRolesToEventUsers < ActiveRecord::Migration[6.0]
  def change
    execute <<-SQL
      CREATE TYPE event_user_roles AS ENUM ('creator', 'admin', 'manager', 'user', 'owner');
    SQL

    add_column :event_users, :role, :event_user_roles
  end
end
