FactoryBot.define do
  sequence(:email) { |n| "test#{n}@example.com" }

  factory :user do
    email
    password { "123456789" }
    first_name { "Jill" }
    last_name { "Smith" }
  end

  factory :user_2 do
    email
    password { "123456789" }
    first_name { "Jack" }
    last_name { "Smith" }
  end

end
