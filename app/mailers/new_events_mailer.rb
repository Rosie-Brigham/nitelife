class NewEventsMailer < ActionMailer::Base
  default from: "zcwcg03+nitelife@live.ucl.ac.uk"

  def confirmation_email(user)
    @user = user
    @event = user.event.last
    @url  = 'http://theres-alot-of-nitelife.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to NiteLife')
  end

end
