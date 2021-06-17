FactoryBot.define do
  factory :purchase_shipping do
    postal_coad { '123-4567' }
    prefecture_id { 2 }
    city { '札幌市' }
    address { 'テスト' }
    building {'テスト'}
    phone_number {'090111111111'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end