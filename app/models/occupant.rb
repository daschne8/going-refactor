class Occupant < ApplicationRecord
  belongs_to :establishment

  has_many :goods

  has_secure_password

  validates :name, presence: true
  validates :name, uniqueness: true

end
