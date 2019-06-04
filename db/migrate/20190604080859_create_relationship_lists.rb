class CreateRelationshipLists < ActiveRecord::Migration[5.1]
  def change
    create_table :relationship_lists do |t|
      t.integer :connection_id
      t.integer :mother_id
      t.integer :father_id
      t.integer :child1_id
      t.integer :child2_id
      t.integer :child3_id
      t.integer :child4_id
      t.integer :child5_id
      t.integer :step_mother_id
      t.integer :step_father_id
      t.integer :sibling1_id
      t.integer :sibling2_id
      t.integer :sibling3_id
      t.integer :sibling4_id
      t.integer :partner_id
      t.integer :husband_id
      t.integer :wife_id

      t.timestamps
    end
  end
end
