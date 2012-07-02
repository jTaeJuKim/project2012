class UserMailer < ActionMailer::Base
  default from: "admin@tkccband.com"

  def welcome_email(user)
  	@user = user
  	@url = signin_path
  	mail(to: user.email, subject: "Your TKCC band app account has been created" )
  end
end
