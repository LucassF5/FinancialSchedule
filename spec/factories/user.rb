FactoryBot.define do
  factory :user do
    username { "testuser" }
    email { "test@email.com" }
    password { "Password123@" }
  end
end
