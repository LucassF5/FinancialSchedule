FactoryBot.define do
  factory :transaction do
    description { "A transaction text" }
    amount { 100 }
    transaction_type { :debit }
    date { "2024-01-01" }
  end
end
