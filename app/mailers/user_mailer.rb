class UserMailer < ActionMailer::Base
  default from: "epic@niteLife.com"


  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to NiteLife')
  end

  def event_alert(user)
    @user = user

    mail(to: @user.email, subject: 'Event Alert')

    
  end

  def date_check
    # if event date - todays date <2 &&  event date - todays date > 0
    #   send the email
    # end
  end

end
