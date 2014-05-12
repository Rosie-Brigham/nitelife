class SelectedEvent < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates :event_id, :uniqueness => { :scope => :user_id }

  def self.send_reminder_emails
    todays_reminders = check_events
    todays_reminders.each do |selected_event|
    selected_event.deliver_reminder
    end
  end

  def self.check_events
    SelectedEvent.includes(:event, :user).select { |se| se.ready_for_reminder? }
  end
 
  def deliver_reminder
    SelectedEventMailer.event_alert(self).deliver
  end

  def ready_for_reminder?
    self.event.date == Date.today+1.day
  end

end
