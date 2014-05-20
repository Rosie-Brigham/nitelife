class EventsController < ApplicationController
before_action :authenticate_user!, except:[:index, :show, :homepage]
  
  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.artist = Artist.find_or_create_by(name: params[:event][:artist])
    @event.user_id = current_user.id
      if @event.valid?
        @event.save
        NewEventsMailer.confirmation_email(current_user).deliver
        redirect_to @event, notice: 'Event was successfully created.'
      else
        render :new
      end
  end

  def show
    @event = Event.find(params[:id])
    @artist = @event.artist
  end

  def index
    @events = Event.search(params[:search])
  end

  def edit
    @event = Event.find(params[:id])
    @artist = @event.artist
    if current_user.admin || current_user.id == @event.user_id
      @event = Event.find(params[:id])
    else
      redirect_to event_path(@event), notice: "I'm sorry, you don't have permission to edit that event"
    end
  end

  def destroy
    @event = Event.find(params[:id])
    if current_user.admin || current_user.id == @event.user_id
      @event.destroy
      redirect_to events_path, notice: "That event has been deleted"
    else
      redirect_to event_path(@event), notice: "I'm sorry, you don't have permission to delete that event"
    end

  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to @event
    else
      render 'edit'
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :genre, :venue, :date, :time, :url, :email, :description, :photo)
  end

end
