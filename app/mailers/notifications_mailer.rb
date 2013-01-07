class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@whispering-savannah-8378.herokuapp.com"
  default :to => "beta@bizroller.com"

  def new_message(message)
    @message = message
    mail(:subject => "[BizRoller.com] #{message.subject}")
  end

end
