# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    id 1
    name 'testuser'
    email 'user@example.com'
    password 'password'
  end
end
