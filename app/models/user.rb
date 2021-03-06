class User < ApplicationRecord
  # Direct associations

  has_many   :connections,
             :dependent => :destroy

  has_many   :notes,
             :foreign_key => "commenter_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

  validates :username, :uniqueness => true

  validates :username, :presence => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
