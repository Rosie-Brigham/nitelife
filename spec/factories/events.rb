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
    lastfm_id '1'
  end

  factory :same_event, parent: :event do
    lastfm_id '1'
  end

  factory :different_lastfm_id_event, parent: :event do
    lastfm_id '42'
  end

  factory :another_lastfm_id_event, parent: :event do
    lastfm_id '67'
  end

  factory :out_of_date_event, parent: :event do
    date { Date.yesterday }
    lastfm_id '24'
  end

  factory :future_event, parent: :event do
    date { Date.today + 1.month }
    lastfm_id '43'
  end
end