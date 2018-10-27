class Api::V1::ExpensesController < ApplicationController

  def index
    @expenses = Expense.all
    render json: @expenses
  end

  def create
    @expense = Expense.create(expense_params)
    render json: @expense
  end

private

  def expense_params
    params.permit(:category_id, :user_id, :total_amount, :date)
  end

end
