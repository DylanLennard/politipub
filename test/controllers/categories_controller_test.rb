require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
	include Devise::TestHelpers
	test "should get categories index" do
		get :index
		assert_response :success
	end

	test "should redirect create when admin is not logeed in" do
		assert_no_difference 'Category.count' do
			post :create, category: { name: "Politics"}
		end
	end
end
