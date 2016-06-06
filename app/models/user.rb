class User < ActiveRecord::Base
  has_secure_password

  has_many :links

  validates :password, :password_confirmation, length: { minimum: 6 }
  validates :email, presence: true, uniqueness: true
end
