require 'test_helper'

class Admin::AuthorFeedsIntegrationTest < ActionController::IntegrationTest

  def test_can_get_to
    visits admin_url
    clicks_link("All Authors")
    assert_equal(@request.url, admin_author_feeds_url())
  end
  
end
