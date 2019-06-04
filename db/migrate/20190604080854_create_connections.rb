class CreateConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :connections do |t|
      t.string :name
      t.string :image
      t.string :location
      t.date :birthday
      t.integer :user_id

      t.timestamps
    end
  end
end
