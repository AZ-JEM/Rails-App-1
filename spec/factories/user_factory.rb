FactoryBot.define do

  # sequence(:email) { |n| "user#{n}@example.com" }

  factory :user do
    email       { Faker::Internet.safe_email }
    password    { "abc123"      }
    first_name  { "Persona"     }
    last_name   { "Fabricated"  }
    admin       { false         }
  end

  factory :admin, class: User do
    email
    password    { "abc123"      }
    first_name  { "Admin"       }
    last_name   { "Fabricated"  }
    admin       { true          }
  end

end
