FactoryBot.define do
  factory :user do
    gimei = Gimei.name
    nickname {Faker::Name.initials(number:5)}
    email {Faker::Internet.free_email}
    password = Faker::Internet.password("aaa1234")
    password {password}
    password_confirmation {password}
    last_name {gimei.last.kanji}
    first_name {gimei.first.kanji}
    last_name_kana {gimei.last.katakana}
    first_name_kana {gimei.first.katakana}
    birth {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end