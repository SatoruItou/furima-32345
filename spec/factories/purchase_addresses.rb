FactoryBot.define do
  factory :purchase_address do
    postal_code { '123-4567' }
    prefecture_id { 3 }
    city { '東京市' }
    address { '青山1-1' }
    building { '東京ハイツ' }
    phone_number { '09012345678' }
    token { 'tok_1234' }
  
  end
end
