FactoryBot.define do
  factory :goal do
    body { Faker::DumbAndDumber.quote }
    user_id { User.first.id }
  end
end
