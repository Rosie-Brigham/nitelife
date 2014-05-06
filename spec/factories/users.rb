# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :user do
    # email "foo@foo.com"
    sequence(:email) { |n| "foo-#{n}@foo.com" }
    password "Foooooo1"
  end
  
end
