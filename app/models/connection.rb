class Connection < ApplicationRecord
  mount_uploader :image, ImageUploader

  # Direct associations

  has_one    :relationship_list,
             :dependent => :destroy

  has_many   :notes,
             :dependent => :destroy

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

  validates :image, :presence => true

end
