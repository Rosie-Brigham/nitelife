FactoryGirl.define do
  
  factory :event do
    name 'big night'
    genre 'classical'
    venue 'the barbican'
    artist 'faure'
    description 'a performance of the faure requiem'
    url 'barbican.co.uk'
    email 'barbican@barbican.co.uk'
    date { Date.tomorrow }
    time '7:30pm'
  end

  factory :out_of_date_event, parent: :event do
    date { Date.yesterday }
    end
end