FactoryGirl.define do
  factory :selected_event do
    association :event
    association :user
  end

  factory :future_selected_event, class: SelectedEvent do
    association :event, factory: :future_event
    association :user
  end

  factory :different_selected_event, class: SelectedEvent do
    association :event, factory: :different_lastfm_id_event
    association :user
  end

  factory :another_selected_event, class: SelectedEvent do
    association :event, factory: :another_lastfm_id_event
    association :user
  end
end
