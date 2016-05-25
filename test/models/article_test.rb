require 'test_helper'
include Devise::TestHelpers

class ArticleTest < ActiveSupport::TestCase

	def setup
		@request.env["devise.mapping"] = Devise.mappings[:admin]
		@article = Article.new(title: "Article Title")
	end

	test "Article should be valid" do 
		assert @article.valid?
	end

end
