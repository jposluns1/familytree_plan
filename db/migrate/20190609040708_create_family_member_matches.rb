class CreateFamilyMemberMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :family_member_matches do |t|
      t.integer :family_id
      t.integer :member_id
      t.string :generation

      t.timestamps
    end
  end
end
