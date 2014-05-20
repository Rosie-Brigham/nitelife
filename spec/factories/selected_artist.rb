FactoryGirl.define do
  factory :selected_artist do
    association :artist
    association :user
  end
end
