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

# roles for the position table
role_list = [
  { role: 'President' },
  { role: 'Vice-President' },
  { role: 'Treasurer' },
  { role: 'Secretary' },
  { role: 'Member at Large' }
]

FactoryBot.define do
  factory :position do
    role { role_list.sample[:role]}
  end
end

region_list = [
  { name: 'Atlantic' },
  { name: 'BC-Yukon' },
  { name: 'National Capital Region' },
  { name: 'Ontario' },
  { name: 'Prairies/NWT' },
  { name: 'Quebec' }
]

FactoryBot.define do
  factory :region do
    name { region_list.sample[:name] }
  end
end

department_list = [
  { name: 'Fisheries and Oceans Canada' },
  { name: 'Natural Resources Canada' },
  { name: 'Health Canada' },
  { name: 'Environment and Climate Change Canada' },
  { name: 'Indigenous Services Canada' }
]

FactoryBot.define do
  factory :department do
    name { department_list.sample[:name] }
  end
end

classification_list = [
  { name: 'AC' },
  { name: 'AG' },
  { name: 'BI' },
  { name: 'CH' },
  { name: 'FO' },
  { name: 'MT' },
  { name: 'PC' },
  { name: 'SG-SRE' },
  { name: 'SG-PAT' }
]

FactoryBot.define do
  factory :classification do
    name { classification_list.sample[:name] }
  end
end

subgroup_list = [
  { name: "SP 123 Main Street, Winnipeg" },
  { name: "SP 401 Burrard Street" },
  { name: "SP 4900 Yonge St - Toronto" },
  { name: "SP 50 Victoria St, Place du Portage" },
  { name: "SP 501 University Crescent" },
  { name: "SP Confederation Heights Plus" },
  { name: "SP Downtown Edmonton" },
  { name: "SP ECC Toronto" },
  { name: "SP Edmonton" },
  { name: "SP Est Québec" },
  { name: "SP Fredericton" },
  { name: "SP Gander" },
  { name: "SP Hamilton-Burlington" },
  { name: "SP Mainland Nova Scotia" },
  { name: "SP Moncton" },
  { name: "SP Montréal" },
  { name: "SP NCR" },
  { name: "SP Nanaimo" },
  { name: "SP Quebec-City - NRCAN" },
  { name: "SP Scarborough" },
  { name: "SP South Saskatchewan" },
  { name: "SP St-Hyacinthe" },
  { name: "SP St. Andrews" },
  { name: "SP St. John's" },
  { name: "SP Tunney's Plus" },
  { name: "SP Vancouver" },
  { name: "SP Victoria" },
  { name: "SP Winnipeg Central" },
  { name: "SP Winnipeg" },
  { name: "SP Yellowknife" },
  { name: "SP Yukon" }
]

FactoryBot.define do
  factory :subgroup do
    name { subgroup_list.sample[:name] }
  end
end

exec_role_list = [
    { role: 'President' },
    { role: 'Vice-President' },
    { role: 'Treasurer' },
    { role: 'Secretary' },
    { role: 'Chief Steward'  },
    { role: 'Communications Coordinator' },
    { role: 'Delegate Coordinator'  },
    { role: ' Membership Coordinator' },
    { role: 'Bargaining Team Coordinator' },
    { role: 'Mobilization Coordinator' },
    { role: 'Recognition Coordinator' },
    { role: 'Parliamentarian' }
]

FactoryBot.define do
  factory :executive do
    role { exec_role_list.sample[:role] }
  end
end

FactoryBot.define do
  factory :member do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    phone_number { Faker::PhoneNumber.cell_phone }

    association :region, factory: :region
    association :department, factory: :department
    association :classification, factory: :classification

    trait :subgroup do
      association :subgroup, factory: :subgroup
    end

    trait :subgroup_position do
      association :position, factory: :position
    end

    trait :executive do
      association :executive, factory: :executive
    end
  end
end