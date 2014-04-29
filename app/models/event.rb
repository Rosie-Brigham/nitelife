class Event < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :genre, presence: true
  validates :artist, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :venue, presence: true


  def self.search(search)
    if search
      where(['name LIKE ? OR genre LIKE ? OR artist LIKE ? OR venue LIKE ?', "%#{search}%", "%#{search}%" , "%#{search}%" , "%#{search}%"] )
    else
      all
    end
  end

end
