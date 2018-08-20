FactoryBot.define do
  factory :user do
    email       { "abc@123.com" }
    password    { "abc123"            }
    first_name  { "Persona"           }
    last_name   { "Fabricated"        }
    admin       { false               }
  end
end
