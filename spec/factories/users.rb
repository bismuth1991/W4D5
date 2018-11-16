FactoryBot.define do
  factory :user do
    username { Faker::Cat.name}
    password { '123456' }
  end
end
