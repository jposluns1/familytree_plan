class Member < ApplicationRecord
  # Direct associations

  has_many   :family_member_matches,
             :dependent => :destroy

  has_one    :partner_2,
             :class_name => "PartnerMatch",
             :foreign_key => "member_id_2",
             :dependent => :destroy

  has_one    :partner_1,
             :class_name => "PartnerMatch",
             :foreign_key => "member_id_1",
             :dependent => :destroy

  has_many   :notes,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
