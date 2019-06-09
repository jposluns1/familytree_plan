class Note < ApplicationRecord
  # Direct associations

  belongs_to :member

  belongs_to :user

  # Indirect associations

  # Validations

  validates :body, :presence => true

  validates :member_id, :presence => true

end
