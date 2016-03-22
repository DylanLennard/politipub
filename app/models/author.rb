class Author < ActiveRecord::Base
	validates :admin_id, uniqueness: true
	belongs_to :admin
	has_attached_file :profile_image, styles: { medium: "300x300#", small: "100x100#" }
  	validates_attachment_content_type :profile_image, :content_type => /\Aimage\/.*\Z/
end
