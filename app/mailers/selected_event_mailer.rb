class SelectedEventMailer < ActionMailer::Base
  default from: "zcwcg03+nitelife@live.ucl.ac.uk"

  def event_alert(selected_event)
    @url  = 'http://ourfutureurl.com/login'
    @event= selected_event.event
    @email = selected_event.user.email
    mail(to: @email, subject: 'Event Alert')
  end
end