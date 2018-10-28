class CreateBillShares < ActiveRecord::Migration[5.2]
  def change
    create_table :bill_shares do |t|
      t.integer :friendship_id
      t.integer :user_id
      t.decimal :amount, :precision => 10, :scale => 2
      t.timestamps
    end
  end
end
