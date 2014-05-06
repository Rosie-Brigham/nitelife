class UserMailer < ActionMailer::Base
  default from: "epic@niteLife.com"

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to NiteLife')
  end

end
