class ContactForm < ActiveRecord::Base

  def send_contact_form
    ContactForm.contact_form(self).deliver_now
  end


end
