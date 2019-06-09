class CreatePartnerMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :partner_matches do |t|
      t.integer :member_id_1
      t.integer :member_id_2

      t.timestamps
    end
  end
end
