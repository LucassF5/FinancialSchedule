FactoryBot.define do
  factory :user do
    username { "testuser" }
    email { "test@email.com" }
    password { "password" }
  end
end
