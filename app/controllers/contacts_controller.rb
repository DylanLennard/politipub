class ContactsController < ApplicationController
	def new
		@contact = Contact.new
	end

	def create
		@contact = Contact.new(contact_params)
		if @contact.valid?
			ContactMailer.new_contact(@contact).deliver
			redirect_to contact_path, notice: "Your message has been sent. Please
			allow 48 hours for a response from our team."
		else
			flash[:alert] = "An error occurred while delivering this message."
		    render 'new'
		end
	end

	private

	def contact_params
	    params.require(:contact).permit(:first_name, :last_name, :email, :article_title,
	    	:article_sample, :article_category, :social_media, :reason)
  	end
end
