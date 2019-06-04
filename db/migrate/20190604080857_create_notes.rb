class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.text :body
      t.integer :commenter_id
      t.integer :connection_id

      t.timestamps
    end
  end
end
