class AddFamilyCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :families_count, :integer
  end
end
