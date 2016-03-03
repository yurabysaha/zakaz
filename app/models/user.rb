class User < ActiveRecord::Base

  validates :login, presence: true,
            uniqueness: true
  validates :password, presence: true,
            confirmation: true

  has_secure_password

end