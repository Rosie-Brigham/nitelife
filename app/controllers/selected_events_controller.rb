class SelectedEventsController < ApplicationController

  def index
    @selected_events = SelectedEvent.all
  end

  def create
    @selected_event = SelectedEvent.new
    @selected_event.user_id = current_user.id
    @selected_event.event_id = Event.find(params[:event_id]).id
    @selected_event.save
    redirect_to selected_events_path
  end

  def new
      @selected_event = SelectedEvents.new
  end


end
