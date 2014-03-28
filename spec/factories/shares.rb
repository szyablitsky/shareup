# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :share do
    from_user_id 1
    # to_user_id
    to_email "user@example.com"
    created_at "2014-01-01 00:00:00"
    url "http://example.com/"
  end
end
