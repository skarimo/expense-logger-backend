class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :email, :friends, :requested_friendships
  has_many :bill_shares
  has_many :expenses
end
