require 'test_helper'

class Admin::AuthorFeeds::RecentIntegrationTest < ActionController::IntegrationTest
  
  fixtures :users, :author_feeds, :feeds
  
  def test_can_get_to_and_assign_a_user
    visits admin_url
    clicks_link("Recent Author Feeds")
    clicks_link("Unassigned")
    selects(users(:amos).name)
    clicks_button("Update")
    assert_equal(author_feeds(:unassigned).user, users(:amos))
  end

end
