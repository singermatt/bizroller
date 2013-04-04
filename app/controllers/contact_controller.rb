class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    
    if verify_recaptcha
        if @message.valid?
            NotificationsMailer.new_message(@message).deliver
            redirect_to(root_path, :notice => "Message was successfully sent.")
        else
            flash.now.alert = "Please fill in all fields."
            render :new
        end
    else
    #  build_resource
    #  clean_up_passwords(resource)
      flash.delete(:recaptcha_error)
      flash.now[:alert] = "There was an error with the recaptcha code below. Please re-enter the code."
      render :new
    end



  end

end
