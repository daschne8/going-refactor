class Occupant < ApplicationRecord
  belongs_to :establishment

  has_many :goods

  has_secure_password

  validates :name, presence: true
  validates :name, uniqueness: true

  # def self.from_omniauth(auth)
  #   where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
  #     user.email = auth.info.email
  #     user.uid = auth.uid
  #     user.provider = auth.provider
  #     user.avatar_url = auth.info.image
  #     user.username = auth.info.name
  #     user.oauth_token = auth.credentials.token
  #     #bcrpyt hack
  #     user.password_digest = "password"
  #     user.name = user.username
  #     user.save!
  #   end
  # end

end
