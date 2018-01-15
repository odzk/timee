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

 	def contact_params
    params.require(:contact_form).permit(:name, :email, :subject, :message)
    
  	end

end
