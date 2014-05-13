class Artist < ActiveRecord::Base
  has_many :events
  has_many :selected_artists


  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"] )
    else
      all.latest
    end
  end
end