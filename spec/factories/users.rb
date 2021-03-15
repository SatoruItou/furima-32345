FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname { Faker::Name.initials(number: 5) }
    email { Faker::Internet.free_email }
    password  { 'a1' + Faker::Internet.password(min_length: 6, max_length: 20) } 
    password_confirmation { password }
    last_name { gimei.last.kanji }
    first_name { gimei.first.kanji }
    last_name_kana { gimei.last.katakana }
    first_name_kana { gimei.first.katakana }
    birth { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
