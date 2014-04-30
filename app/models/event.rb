# require 'Date'

class Event < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :genre, presence: true
  validates :artist, presence: true
  validates :date, presence: true 
  validates :time, presence: true
  validates :venue, presence: true
  # validate :date_cannot_be_in_past
  validate :must_be_valid_date

  before_save :date_cannot_be_in_past


  def self.search(search)
    if search
      where(['name LIKE ? OR genre LIKE ? OR artist LIKE ? OR venue LIKE ?', "%#{search}%", "%#{search}%" , "%#{search}%" , "%#{search}%"] )
    else
      all
    end
  end

private

  def date_cannot_be_in_past
    if date < Date.today
      errors.add(:date, "can't be in the past") 
    end    
  end

  def must_be_valid_date
    if !date.is_a?(Date)
      errors.add(:started_at, 'must be a valid date') 
    end
  end
  
end
