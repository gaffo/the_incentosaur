require File.dirname(__FILE__) + "/../../test_helper"

class Admin::FeedTypesTest < ActionController::IntegrationTest
	
	def test_index
      visits admin_feed_types_url
      assert_response :success
	end
	
	def test_create_feed_type
	  visits admin_feed_types_url
	  clicks_link "Create"
	  assert_response :success
	  fills_in "record[name]", :with => "New Type"
	  before = FeedType.count
	  clicks_button "Create"
	  assert_equal(before + 1, FeedType.count)
	end
	
end