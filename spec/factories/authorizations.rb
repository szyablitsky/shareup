# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :authorization do
    provider "Twitter"
    uid "UID"
    user_id 1
    token "TOKEN"
    secret "SECRET"
    name "UserName"
    url "http://example.com/user/1"
  end
end
