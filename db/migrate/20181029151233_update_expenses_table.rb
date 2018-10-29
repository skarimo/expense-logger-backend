class UpdateExpensesTable < ActiveRecord::Migration[5.2]
  def change
    change_table :expenses do |t|
    t.change :total_amount, :decimal, :precision => 40, :scale => 2
    end
  end
end
