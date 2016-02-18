class Article < ActiveRecord::Base
	has_attached_file :banner_image, styles: { medium: "300x300#", small: "100x100#" }
  	validates_attachment_content_type :banner_image, :content_type => /\Aimage\/.*\Z/
end
