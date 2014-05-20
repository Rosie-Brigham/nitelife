class UserMailer < ActionMailer::Base
  default from: "zcwcg03+nitelife@live.ucl.ac.uk"

  def welcome_email(user)
    @user = user
    @url  = 'http://theres-alot-of-nitelife.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to NiteLife')
  end

end
