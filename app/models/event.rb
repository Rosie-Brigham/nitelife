class Event < ActiveRecord::Base
  # belongs_to :user

  validates :name, presence: true
  validates :genre, presence: true
  validates :artist, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :venue, presence: true
end
