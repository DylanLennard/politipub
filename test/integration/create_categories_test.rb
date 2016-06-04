require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

	test "get new category form and create category" do
		get new_category_path
		assert_template 'categories/new'
		assert_difference 'Category.count', 1 do 
			post categories_path, category: {name: "Politics"}
		end
	end

	test "invalid category submission should fail" do
		get new_category_path
		assert_template 'categories/new'
		assert_no_difference 'Category.count' do 
			post categories_path, category: {name: ""}
		end
		assert_template 'categories/new'
	end
end	
