class Author < ActiveRecord::Base
	has_many :articles
	has_attached_file :profile_image, styles: { medium: "300x300#", small: "100x100#" }
  	validates_attachment_content_type :profile_image, :content_type => /\Aimage\/.*\Z/
end
