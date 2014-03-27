# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    id 1
    email 'user@example.com'
    encrypted_password 'SECRET'
  end
end
