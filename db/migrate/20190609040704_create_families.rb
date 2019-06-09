class CreateFamilies < ActiveRecord::Migration[5.1]
  def change
    create_table :families do |t|
      t.string :family_name
      t.text :family_description
      t.integer :user_id

      t.timestamps
    end
  end
end
