class User < ApplicationRecord
  has_many :expenses
  validates_presence_of :first_name, :last_name, :username, :email, :password_digest
  validates :email, uniqueness: true
  validates :username, uniqueness: true

  has_many :bill_shares
  has_many :friendships
  has_many :received_friendships, class_name: "Friendship", foreign_key: "friend_id"

  has_many :active_friends, -> { where(friendships: { accepted: true}) }, through: :friendships, source: :friend
  has_many :received_friends, -> { where(friendships: { accepted: true}) }, through: :received_friendships, source: :user
  has_many :pending_friends, -> { where(friendships: { accepted: false}) }, through: :friendships, source: :friend
  has_many :requested_friendships, -> { where(friendships: { accepted: false}) }, through: :received_friendships, source: :user
  has_secure_password

  def friends
    active_friends | received_friends
  end

  def pending
    pending_friends | requested_friendships
  end

  def accept(friendship_id)
    friendship = Friendship.find(friendship_id).update(accepted: true)
    user_id = friendship.user_id
    friend_id = friendship.friend_id
    friendship.bill_shares.create(user_id: user_id)
    friendship.bill_shares.create(user_id: friend_id)
  end

end
