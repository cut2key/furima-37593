FactoryBot.define do
  factory :purchase_address do
    transient do
      address { Gimei.address }
    end
    zip_code {'123-4567'}
    country_id {2}
    city {address.city.kanji}
    st_address {'あああ１−１'}
    building {'あ101'}
    phone_num {Faker::Number.number(digits: 10)}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
