FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    password { '1a' + Faker::Internet.unique.password(min_length: 6)}
    password_confirmation { password }
    last_name { '鈴木' }
    first_name { '一郎' }
    last_name_kana { 'スズキ' }
    first_name_kana { 'イチロウ' }
    dob { Faker::Date.birthday }
  end
end