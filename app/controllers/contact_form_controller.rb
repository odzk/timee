class ContactFormController < ApplicationController

    def new
      @contact_form = ContactForm.new
        
    end

    def create

      @contact_form = ContactForm.new(contact_params)
      if @contact_form.save

          flash[:success] = "Message Sent"
        redirect_to "/login"
       end

    end


    def send_contact_form
    @contact_email = params[:contact_form][:email].downcase
    @contact_form.send_contact_form

    end



 	def contact_params
    params.require(:contact_form).permit(:name, :email, :subject, :message)
    
  	end

end
