FactoryBot.define do
  factory :item do
    name { Faker::Book.title }
    info { Faker::Music::Prince.lyric }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    sales_id { 2 }
    prefecture_id { 2 }
    scheduled_id { 2 }
    category_id { 2 }
    shipping_id { 2 }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'),
                        filename: 'test_image.png')
    end
  end
end
