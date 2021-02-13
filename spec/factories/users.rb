FactoryBot.define do
  factory :user do
    nickname               { Faker::Name.name }
    email                  { Faker::Internet.free_email }
    password               { 'test1234' }
    password_confirmation  { password }
    last_name              { Gimei.last.kanji }
    first_name             { Gimei.first.kanji }
    last_name_ruby         { Gimei.last.katakana }
    first_name_ruby        { Gimei.first.katakana }
    birth_day              { Faker::Date.backward }
  end
end
