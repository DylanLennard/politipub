class Contact
	  include ActiveModel::Model
	  include ActiveModel::Conversion
	  include ActiveModel::Validations

      attr_accessor :first_name, :last_name, :email, :article_title,
	    			:article_sample, :article_category, :social_media, :reason

	  validates :first_name,
	    presence: true

	  validates :email,
	    presence: true
end