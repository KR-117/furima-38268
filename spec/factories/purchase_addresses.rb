FactoryBot.define do
  factory :purchase_address do
    user_id { 1 }
    item_id { 1 }
    postal_code { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    house_number { Faker::Address.street_address }
    building_name { "建物名" }
    phone_number { Faker::Number.decimal_part(digits: 11) }
    token {"tok_abcdefghijk00000000000000000"}
  end
end
