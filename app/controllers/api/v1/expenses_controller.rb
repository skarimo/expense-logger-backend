class Api::V1::ExpensesController < ApplicationController

  def index
    @expenses = Expense.all
    render json: @expenses
  end

  def create
    @expense = Expense.create(category_id: params[:category_id], user_id: params[:user_id], total_amount: params[:total_amount].to_f, date: params[:date])
    render json: @expense
  end

private

  def expense_params
    params.permit(:category_id, :user_id, :total_amount, :date)
  end

end
