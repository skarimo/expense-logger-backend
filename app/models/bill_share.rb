class BillShare < ApplicationRecord
  belongs_to :friendship
  has_many :users, through: :friendship
end
