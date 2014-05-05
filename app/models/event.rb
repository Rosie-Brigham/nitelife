# require 'Date'

class Event < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :genre, presence: true
  validates :artist, presence: true
  validates :date, presence: true 
  validates :time, presence: true
  validates :venue, presence: true
  validate :must_be_valid_date

  has_attached_file :photo, :styles => { 
    :medium => "300x300>", :thumb => "100x100>", :large => "500x500>"
    }, :default_url => "/images/:style/missing.png"
  
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
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
