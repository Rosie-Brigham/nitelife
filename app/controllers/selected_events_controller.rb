class SelectedEventsController < ApplicationController

  def index
    

    if user_signed_in?
      @selected_events = SelectedEvent.all
      @selected_events.each do |event|
      
        if event.user_id == current_user.id
          @selected_event_for_user = event
        end
      end

    else
      redirect_to events_path, notice: 'stop trying to break my site, naughty devloper!'
    end

  end

  def create
    @selected_event = SelectedEvent.new
    @selected_event.user_id = current_user.id
    @selected_event.event_id = Event.find(params[:event_id]).id
    @selected_event.save
    redirect_to selected_events_path
  end

end
