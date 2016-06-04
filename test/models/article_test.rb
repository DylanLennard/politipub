require 'test_helper'

class ArticleTest < ActiveSupport::TestCase

	def setup
		@article = Article.new(title: "Article Title")
	end

	test "Article should be valid" do 
		assert @article.valid?
	end

end
