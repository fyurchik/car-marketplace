# spec/factories/posts.rb
FactoryBot.define do
  factory :post do
    association :user
    brand { "Some Brand" }
    model { "Some Model" }
    body_type { "Sedan" }
    mileage { 10000 }
    color { "Red" }
    price { 20000 }
    fuel { "Gasoline" }
    year { 2021 }
    engine_capacity { 2.0 }
    phone_number { "1234567890" }
    name { "Car Name" }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/assets/test_image.jpg'), 'image/png') }
  end
end
