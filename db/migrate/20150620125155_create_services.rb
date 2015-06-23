class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :parent_id, :default => 0
      t.integer :auser_id
      t.boolean :is_published 
      t.string :url
      t.string :full_path
      t.string :header
      t.string :title
      t.text :body
      t.text :additional_body
      
      t.timestamps
    end
  end
end
