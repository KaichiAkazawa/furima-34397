FactoryBot.define do
  factory :item do
    image                  {  }
    name                   { Faker::Name.name }
    description            { Faker::Lorem.sentence }
    category_id            { rand(2..11) }
    state_id               { rand(2..7) }
    shipping_cost_payer_id { rand(2..3) }
    prefecture_id          { rand(2..48) }
    shipping_day_id        { rand(2..4) }
    price                  { rand(300..9999999) }
    association :user
  end
end
