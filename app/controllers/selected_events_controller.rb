class SelectedEventsController < ApplicationController

  def index
    if user_signed_in?
      @selected_events = SelectedEvent.all
    else
      redirect_to events_path, notice: 'stop trying to break my site, naughty developer!'
    end

  end

  def create
    @selected_event = SelectedEvent.new
    @selected_event.user_id = current_user.id
    @selected_event.event_id = Event.find(params[:event_id]).id
    @selected_event.save

    if @selected_event.save
     redirect_to selected_events_path
    else
      redirect_to selected_events_path, notice: "You've already selected that!"
    end
  end

  def destroy
    @selected_event = SelectedEvent.find(params[:id])
    @selected_event.destroy
    redirect_to selected_events_path
  end

end
