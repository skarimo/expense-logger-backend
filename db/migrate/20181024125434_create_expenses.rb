class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.integer :category_id
      t.integer :user_id
      t.string :date
      t.integer :total_amount
      # t.timestamps
    end
  end
end
