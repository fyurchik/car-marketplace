FactoryBot.define do
  factory :admin do
    email { "admin@example.com" }
    password { "securepassword" }
    password_confirmation { "securepassword" }
  end
end
