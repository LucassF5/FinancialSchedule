class AddUserToTransactions < ActiveRecord::Migration[8.0]
  def change
    add_reference :transactions, :user, null: false, foreign_key: true
  end
end
