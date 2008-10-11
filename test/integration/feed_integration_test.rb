require 'test_helper'

class FeedIntegrationTest < ActionController::IntegrationTest

	def test_can_get_to_basic_index
		feed = feeds(:dirty_information)
		visits(root_url)
		clicks_link(feed.name)
		assert_equal(feed_url(feed.id), @request.url)
	end

end
