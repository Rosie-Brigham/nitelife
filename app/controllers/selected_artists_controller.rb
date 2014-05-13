class SelectedArtistsController < ApplicationController

  def index
    if user_signed_in?
      @events = Event.search(params[:search])
    else
      redirect_to events_path, notice: 'stop trying to break my site, naughty developer!'
    end
  end

  def create
    @selected_artist = SelectedArtist.new
    @selected_artist.user_id = current_user.id
    @selected_artist.artist_id = Artist.find(params[:artist_id]).id
    @selected_artist.save

    if @selected_artist.save
      redirect_to selected_artists_path
    else
      redirect_to selected_artists_path, notice: "You've already selected that!"
    end
  end

  def destroy
    @selected_artist = SelectedArtist.find(params[:id])
    @selected_artist.destroy
    redirect_to selected_artist_path
  end

end