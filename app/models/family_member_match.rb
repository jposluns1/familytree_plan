class FamilyMemberMatch < ApplicationRecord
  # Direct associations

  belongs_to :family,
             :counter_cache => true

  belongs_to :member,
             :counter_cache => true

  # Indirect associations

  # Validations

end
