class PartnerMatch < ApplicationRecord
  # Direct associations

  belongs_to :member_2,
             :class_name => "Member",
             :foreign_key => "member_id_2"

  belongs_to :member,
             :foreign_key => "member_id_1"

  # Indirect associations

  # Validations

end
