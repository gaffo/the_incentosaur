require File.dirname(__FILE__) + "/../../test_helper"

class Admin::FeedsTest < ActionController::IntegrationTest
	
	def test_index
	  puts admin_feeds_url
      visits admin_feed_types_url
      assert_response :success
	end
	
	def test_create_feed
	  visits admin_feeds_url
	  clicks_link "Create"
	  assert_response :success
	  fills_in "record[name]", :with => "New Type"
	  fills_in "record[url]", :with => "new_url"
	  before = Feed.count
	  clicks_button "Create"
	  assert_equal(before + 1, Feed.count)
	end
	
end