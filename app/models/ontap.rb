class Ontap < ActiveRecord::Base
	belongs_to :admin
	belongs_to :author
	searchkick
	has_attached_file :banner, styles: { large: "900x900", medium: "300x300#", small: "100x100#" }
  	validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/
end
