class User < ApplicationRecord
  has_many :expenses
  validates_presence_of :first_name, :last_name, :username, :email, :password_digest
  validates :email, uniqueness: true
  validates :username, uniqueness: true
  has_secure_password
end
