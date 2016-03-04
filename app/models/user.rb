class User < ActiveRecord::Base

  validates :mail, presence: true,
            uniqueness: true
  validates :password, presence: true,
            confirmation: true

  has_secure_password

end