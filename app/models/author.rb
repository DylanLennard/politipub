class Author < ActiveRecord::Base
	validates :admin_id, uniqueness: true
	belongs_to :admin
	has_many :articles
	has_many :ontaps
	has_attached_file :profile_image, styles: { medium: "300x300#", small: "200x200#" }
  	validates_attachment_content_type :profile_image, :content_type => /\Aimage\/.*\Z/
end
