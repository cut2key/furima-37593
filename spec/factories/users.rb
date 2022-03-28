FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname {Faker::Lorem.characters(number: 6)}
    #nickname {"タロー"}
    email {Faker::Internet.free_email}
    #email {"taro@com"}
    password = Faker::Internet.password(min_length: 6)
    #password {"taro123"}
    password {password}
    password_confirmation {password}
    #last_name {Faker::Name.last_name}
    last_name {person.last.kanji}
    first_name {person.first.kanji}
    last_kana {person.last.katakana}
    first_kana {person.first.katakana}
    #birthday(1i) {"1930"}
    birthday {Faker::Date.backward}
  end
end