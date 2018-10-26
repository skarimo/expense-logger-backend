class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :total_amount, :category, :date
end
