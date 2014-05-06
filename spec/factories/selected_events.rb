# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :selected_event do
    association :event
    association :user
  end

  factory :out_of_date_selected_event, class: SelectedEvent do
    association :event, factory: :out_of_date_event
    association :user
  end
end
