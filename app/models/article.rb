class Article < ActiveRecord::Base
	belongs_to :admin
	belongs_to :author
	validates_presence_of :banner_image
	has_many :article_categories
	has_many :categories, through: :article_categories
	searchkick
	paginates_per 10
	has_attached_file :banner_image, styles: { large: "900x900", medium: "525x320#", small: "225x150#" }
  	validates_attachment_content_type :banner_image, :content_type => /\Aimage\/.*\Z/
end
