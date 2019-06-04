class AddLocationLatitudeToConnection < ActiveRecord::Migration[5.1]
  def change
    add_column :connections, :location_latitude, :float
  end
end
