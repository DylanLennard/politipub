require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest
	include Devise::TestHelpers

	test "get new article form and create article" do
		get new_article_path
		assert_template 'articles/new'
		assert_difference 'Article.count', 1 do 
			post articles_path, article: {name: "Title"}
		end
	end

	test "invalid article submission should fail" do
		get new_article_path
		assert_template 'articles/new'
		assert_no_difference 'Article.count' do 
			post articles_path, article: {name: ""}
		end
		assert_template 'articles/new'
	end
end	
