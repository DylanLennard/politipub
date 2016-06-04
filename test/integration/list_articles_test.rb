require 'test_helper'

class ListArticlesTest < ActionDispatch::IntegrationTest

	def setup
		@article = Article.create(title: "Title 1") 
		@article2 = Article.create(title: "Title 2")
	end

	test "should show articles index" do
		get articles_path
		assert_template 'articles/index'
		assert_select "a[href=?]", article_path(@article), text: @article.title
		assert_select "a[href=?]", article_path(@article), text: @article2.title
	end
end