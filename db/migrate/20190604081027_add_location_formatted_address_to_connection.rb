class AddLocationFormattedAddressToConnection < ActiveRecord::Migration[5.1]
  def change
    add_column :connections, :location_formatted_address, :string
  end
end
