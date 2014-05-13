class SelectedArtist < ActiveRecord::Base
  belongs_to :user
  belongs_to :artist
  has_many :events, through: :artists
  validates :artist_id, :uniqueness => { :scope => :user_id }
end