# require 'Date'

class Event < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist


  before_validation :smart_add_url_protocol
  validates :name, presence: true
  validates :genre, presence: true
  validates :artist, presence: true
  validates :date, presence: true 
  validates :time, presence: true
  validates :venue, presence: true
  validate :must_be_valid_date 
  validates :lastfm_id, uniqueness: true, allow_nil: true
  validates :url, :format => URI::regexp(%w(http https)) 


  validate :date_cannot_be_in_past
  
  has_attached_file :photo, :styles => { 
    :medium => "300x300>", :thumb => "100x100>", :large => "700x700>", :strip => "300X150>"
    }, :default_url => "/images/:style/missing.png"
  
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
  scope :latest, -> { order(date: :asc, time: :asc)}

  def self.search(search)
    if search
      joins(:artist).where(['events.name ILIKE ? OR events.genre ILIKE ? OR events.venue ILIKE ? OR artists.name ILIKE ?', "%#{search}%" , "%#{search}%" , "%#{search}%", "%#{search}%"] )
    else
      all.latest
    end
  end

  def smart_add_url_protocol
    unless self.url =~ /\Ahttp:\/\// || self.url =~ /\Ahttps:\/\//
      self.url = "http://#{self.url}"
    end
  end

private

  def date_cannot_be_in_past
    if date && date < Date.today
      errors.add(:date, "can't be in the past")
    end    
  end

  def must_be_valid_date
    if !date.is_a?(Date)
      errors.add(:started_at, 'must be a valid date') 
    end
  end
  
end
