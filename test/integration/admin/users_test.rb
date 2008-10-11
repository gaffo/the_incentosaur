require 'test_helper'

class Admin::UsersControllerTest < ActionController::IntegrationTest
	
	tests 'admin/users_controller'
	
	def test_index
      visits admin_users_url
      assert_response :success
	end
	
	# def test_create_feed
	# 	  visits admin_feeds_url
	# 	  clicks_link "Create"
	# 	  assert_response :success
	# 	  fills_in "record[name]", :with => "New Type"
	# 	  fills_in "record[url]", :with => "new_url"
	# 	  fills_in "record[id_xpath]", :with => "//id"
	# 	  fills_in "record[author_xpath]", :with => "//author"
	# 	  fills_in "record[entry_xpath]", :with => "//entry"
	# 	  before = Feed.count
	# 	  clicks_button "Create"
	# 	  assert_response(:success)
	# 	  assert_equal(before + 1, Feed.count)
	# 	end
	
end
