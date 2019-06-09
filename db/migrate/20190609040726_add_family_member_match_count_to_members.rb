class AddFamilyMemberMatchCountToMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :members, :family_member_matches_count, :integer
  end
end
