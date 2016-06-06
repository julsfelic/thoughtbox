class User < ActiveRecord::Base
  has_secure_password

  validates :password, :password_confirmation, length: { minimum: 6 }
  validates :email, presence: true
end
