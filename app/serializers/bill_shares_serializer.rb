class BillSharesSerializer < ActiveModel::Serializer
  attributes :id, :amount, :user_id, :friendship_id
  # belongs_to :friendship
end
