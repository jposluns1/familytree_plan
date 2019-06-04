class Note < ApplicationRecord
  # Direct associations

  belongs_to :user,
             :foreign_key => "commenter_id"

  # Indirect associations

  # Validations

  validates :body, :presence => true

  validates :commenter_id, :presence => true

  validates :connection_id, :presence => true

end
