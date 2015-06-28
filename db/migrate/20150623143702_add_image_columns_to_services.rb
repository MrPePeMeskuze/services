class AddImageColumnsToServices < ActiveRecord::Migration 
  def self.up     
    change_table :services do |t|  
      t.string :image     
    end 
  end 
   
  def self.down   
    drop_collumn :services, :image   
  end 
end