FactoryGirl.define do

  factory :user do
    # email "foo@foo.com"
    sequence(:email) { |n| "foo-#{n}@foo.com" }
    password "Foooooo1"
  end
  
end
