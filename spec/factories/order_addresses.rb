FactoryBot.define do
  factory :order_address do
    post_code { "#{Faker::Number.number(digits: 3)}-#{Faker::Number.number(digits: 4)}" }
    prefecture_id { 2 }
    city { Gimei.city.kanji }
    block { Gimei.town.kanji }
    building { Gimei.town.kanji }
    phone_number { Faker::Number.number(digits: 11) }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
