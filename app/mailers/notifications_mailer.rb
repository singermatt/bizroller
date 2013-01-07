class NotificationsMailer < ActionMailer::Base

  default :from => "noreply@localhost:3000"
  default :to => "beta@bizroller.com"

  def new_message(message)
    @message = message
    mail(:subject => "[BizRoller.com] #{message.subject}")
  end

end
