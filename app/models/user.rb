class User < ActiveRecord::Base
  has_many :events

  has_many :selected_events
  has_many :selected_artists
  has_many :interested_events, through: :selected_events, class_name: "Event", source: :event
  has_many :artists, through: :selected_artists


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def artist_events
    self.artists.includes(:events).collect(&:events)

    Event.includes(artist: :selected_artists).where(selected_artists: {user_id: self.id} )
  end
end
