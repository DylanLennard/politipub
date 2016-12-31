class Ontap < ActiveRecord::Base
	belongs_to :admin
	belongs_to :author
	validates_presence_of :banner
	searchkick
	paginates_per 10
	has_attached_file :banner, styles: { large: "900x900", medium: "525x320#", small: "225x150#" }
  	validates_attachment_content_type :banner, :content_type => /\Aimage\/.*\Z/
end
