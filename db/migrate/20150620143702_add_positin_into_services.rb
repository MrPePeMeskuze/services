class AddPositinIntoServices < ActiveRecord::Migration
  def change
    add_column :services, :position, :integer
  end
end
