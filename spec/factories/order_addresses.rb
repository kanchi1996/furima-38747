FactoryBot.define do
  factory :order_address do
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { '東京都' }
    address { '0-1' }
    building_name { 'sakura' }
    phone_num {'11111111111'}
    token {"tok_abcdefghijk00000000000000000"}    
  end
end
