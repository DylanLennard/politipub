class ContactMailer < ActionMailer::Base
  def new_contact(contact)
    @contact = contact

    mail subject: "New Sign Up from #{contact.first_name} #{contact.last_name} at #{contact.email}"

  end

end
