require File.dirname(__FILE__) + "/../../test_helper"

class Admin::FeedsTest < ActionController::IntegrationTest
	
	def test_index
    visits admin_url
    clicks_link("Feeds")
	end
	
	def test_create_feed
    visits admin_url
    clicks_link("Feeds")
	  clicks_link "Create"
	  assert_response :success
	  fills_in "record[name]", :with => "New Type"
	  fills_in "record[url]", :with => "new_url"
	  fills_in "record[idkey_xpath]", :with => "id"
	  fills_in "record[authorxpath]", :with => "author/name"
	  fills_in "record[full_postxpath]", :with => "//entry"
	  before = Feed.count
	  clicks_button "Create"
	  assert_response(:success)
	  assert_equal(before + 1, Feed.count)
	end
	
end