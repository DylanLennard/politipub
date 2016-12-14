class Category < ActiveRecord::Base
	validates :name, presence: true, length: { minimum: 3, maximum: 25}
	validates_uniqueness_of :name
	has_many :article_categories
	has_many :articles, through: :article_categories
	has_attached_file :image, styles: { large: "900x900", medium: "525x320#", small: "225x150#" }
  	validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
