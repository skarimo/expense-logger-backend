class FriendshipSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :friend_id, :accepted
  # has_many :bill_shares
end
