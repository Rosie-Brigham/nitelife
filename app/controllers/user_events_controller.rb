class UserEventsController < ApplicationController
  
  def index
    # @event = Event.all
    # @event.user_id == .id 
    if current_user == nil
      redirect_to events_path, notice: 'you need to log in/sign up!'
    elsif current_user.events == nil 
      redirect_to new_events_path, notice: 'you need to create some events!'
    else
      @users_events = current_user.events
    end
  end
end
