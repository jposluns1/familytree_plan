class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.text :body
      t.integer :member_id
      t.integer :user_id

      t.timestamps
    end
  end
end
