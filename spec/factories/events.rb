FactoryGirl.define do
  
  factory :event do
    name 'big night'
    genre 'classical'
    venue 'the barbican'
    association :artist
    description 'a performance of the faure requiem'
    url 'barbican.co.uk'
    email 'barbican@barbican.co.uk'
    date { Date.tomorrow }
    time '7:30pm'
    last_id '1'
  end

  factory :same_event, parent: :event do
    last_id '1'
  end

  factory :different_last_id_event, parent: :event do
    last_id '42'
  end

  factory :another_last_id_event, parent: :event do
    last_id '67'
  end

  factory :out_of_date_event, parent: :event do
    date { Date.yesterday }
    last_id '24'
  end

  factory :future_event, parent: :event do
    date { Date.today + 1.month }
    last_id '43'
  end
end