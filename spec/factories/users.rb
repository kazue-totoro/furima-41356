require 'faker'
require 'nkf'

FactoryBot.define do
  factory :user do
    Faker::Config.locale = 'ja'

    nickname { Faker::Name.middle_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    family_name_kana { NKF.nkf('-w -x', Faker::Name.last_name) }
    first_name_kana { NKF.nkf('-w -x', Faker::Name.first_name) }
    birth_day { Faker::Date.between(from: Date.new(1930, 1, 1), to: '2019-12-31') }
  end
end
