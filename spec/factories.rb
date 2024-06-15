FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password }
  end
end

FactoryBot.define do
  factory :event  do
    name { Faker::Name.name }
    location { Faker::Address.full_address }
    date { Faker::Date.between(from: 1.month.ago, to: 1.month.from_now) }

    trait :past do
      date { Faker::Date.backward(days: 14) }
    end

    trait :future do
      date { Faker::Date.forward(days: 14) }
    end
  end
end

FactoryBot.define do
  factory :post do
    title { Faker::Book.title }

    trait :chosen_date do
      date { Faker::Date.backward(days: 365) }
    end
  end
end