class CreateTransactions < ActiveRecord::Migration[8.0]
  def change
    create_table :transactions do |t|
      t.decimal :amount, null: false, precision: 10, scale: 2
      t.integer :transaction_type, null: false
      t.date :date, null: false
      t.text :description, limit: 255

      t.timestamps
    end
  end
end
