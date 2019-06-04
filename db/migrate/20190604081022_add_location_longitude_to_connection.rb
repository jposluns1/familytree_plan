class AddLocationLongitudeToConnection < ActiveRecord::Migration[5.1]
  def change
    add_column :connections, :location_longitude, :float
  end
end
