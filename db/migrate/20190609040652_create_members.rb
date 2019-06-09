class CreateMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :members do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :relationship_description
      t.string :birth_month
      t.integer :birth_day
      t.integer :birth_year
      t.string :gender
      t.string :location
      t.string :anniversary_month
      t.integer :anniversary_day
      t.integer :anniversary_year
      t.boolean :passed
      t.boolean :ex

      t.timestamps
    end
  end
end
