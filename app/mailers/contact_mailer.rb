class ContactMailer < ActionMailer::Base
  default from: "PolitiPub <noreply@yourdomain.com>"
  default to: "Mason Matthews <politipub@gmail.com>"
  def new_contact(contact)
    @contact = contact

    mail subject: "New Sign Up from #{contact.first_name} #{contact.last_name} at #{contact.email}"

  end

end
