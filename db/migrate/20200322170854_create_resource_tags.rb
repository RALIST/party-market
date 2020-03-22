class CreateResourceTags < ActiveRecord::Migration[6.0]
  def change
    create_table :resource_tags do |t|
      t.references :resource, polymorphic: true
      t.references :tag
      t.timestamps
    end
  end
end
