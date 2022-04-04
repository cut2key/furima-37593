FactoryBot.define do
  factory :item do
    item_name { Faker::Lorem.characters(number: 8) }
    item_description {Faker::Lorem.sentence}
    category_id {2}
    quality_id {2}
    ship_fee_id {2}
    country_id {2}
    ship_day_id {2}
    price {Faker::Number.between(from: 300, to: 9999999)}
    association :user
    
    after (:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
