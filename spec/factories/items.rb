FactoryBot.define do
  factory :item do
    image { "test_image.png" }
    name { Faker::Name.initials(number: 40) }
    info { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    fee_status_id { 2 }
    prefecture_id { 2 }
    schedule_delivery_id { 2 }
    price { 10000 }
    association :user
  end
end
