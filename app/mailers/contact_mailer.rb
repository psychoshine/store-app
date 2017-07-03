class ContactMailer < ApplicationMailer
	def fresh_message(saved_contact_u, email)
		@saved_contact_u = saved_contact_u
	    @email = email
	    mail to: @email, subject: "New message from your website"
  	end

end
