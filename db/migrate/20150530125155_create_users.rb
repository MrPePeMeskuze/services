class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :email
      t.boolean :is_admin 
      t.boolean :is_published
      t.string :name
      t.string :last_name
      t.string :middle_name

      t.timestamps
    end
  end
end
