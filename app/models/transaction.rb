class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :category

  enum :transaction_type, [ :debit, :credit ]

  validates :amount, :transaction_type, :date, presence: true
  validates :transaction_type, inclusion: { in: transaction_types.keys }
  validates :amount, numericality: { greater_than: 0 }
  validates :date, comparison: { less_than_or_equal_to: Date.today }
  validates :description, length: { maximum: 255 }
end
