FactoryGirl.define do
  
  factory :event do
    name 'big night'
    genre 'classical'
    venue 'the barbican'
    artist 'faure'
    description 'a performance of the faure requiem'
    url 'barbican.co.uk'
    email 'barbican@barbican.co.uk'
    date '15/06/2014'
    time '7:30pm'
  end

end