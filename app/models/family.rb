class Family < ApplicationRecord
  # Direct associations

  has_many   :family_member_matches,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
