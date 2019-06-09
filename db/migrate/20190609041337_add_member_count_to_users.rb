class AddMemberCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :members_count, :integer
  end
end
