class EventsController < ApplicationController

    def new
      @event = Event.new
    end

    def create
      # render plain: params[:event].inspect
      @event = Event.new(event_params)

      @event.save
      redirect_to @event
        # if @event.valid?
        #   @event.save
        #   redirect_to @event
        # else
        #   render :new
        # end
    end
    
    def show
      @event = Event.find(params[:id])
    end

    def index
      @events = Event.all
    end

    def edit
      @event = Event.find(params[:id])
    end

    def destroy
      @event = Event.find(params[:id])
      @event.destroy
    end

    private

    def event_params
      params.require(:event).permit(:name, :genre, :venue, :artist, :date, :time, :url, :email, :description)
    end

end
