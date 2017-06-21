class Comments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.integer :project_id
      t.text :input
      t.datetime :created_at
      t.datetime :updated_at
      t.timestamps
    end
  end
end
