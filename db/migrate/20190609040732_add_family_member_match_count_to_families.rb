class AddFamilyMemberMatchCountToFamilies < ActiveRecord::Migration[5.1]
  def change
    add_column :families, :family_member_matches_count, :integer
  end
end
