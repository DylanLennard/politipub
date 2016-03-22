class Article < ActiveRecord::Base
	belongs_to :admin
	belongs_to :author
	searchkick
	paginates_per 8
	has_attached_file :banner_image, styles: { large: "900x900", medium: "300x300#", small: "100x100#" }
  	validates_attachment_content_type :banner_image, :content_type => /\Aimage\/.*\Z/
end
