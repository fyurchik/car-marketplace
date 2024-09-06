FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { 'securepassword' }
    password_confirmation { 'securepassword' }
  end
end
