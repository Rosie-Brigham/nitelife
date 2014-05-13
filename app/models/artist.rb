class Artist < ActiveRecord::Base
  has_many :events
  has_many :selected_artists
end