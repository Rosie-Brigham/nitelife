# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :selected_event do
    association :event
    association :user
  end

  factory :future_selected_event, class: SelectedEvent do
    association :event, factory: :future_event
    association :user
  end
end
