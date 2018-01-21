class ContactFormMailer < ApplicationMailer

  def send_contact_form(user)
    @user = user
    mail to: user.email, subject: "Contact Form Inquiry"
  end


end
