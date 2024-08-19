FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    item_details { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    shipping_fee_id { 2 }
    prefecture_id { 2 }
    shipping_date_id { 2 }
    price { Faker::Commerce.price(range: 300..9_999_999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png', content_type: 'image/png')
    end
  end
end
