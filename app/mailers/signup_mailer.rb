class SignupMailer < ActionMailer::Base
  default from: "beta@bizroller.com"


  def signup_confirmation(user)
    @user = user

    mail to: user.email, subject: "Thank You for Signing Up for BizRoller", bcc: "singermjs@gmail.com"
  end
end
