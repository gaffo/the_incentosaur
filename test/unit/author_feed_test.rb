require File.dirname(__FILE__) + "/../test_helper"
class AuthorFeedTest < ActiveSupport::TestCase
	
	# should_require_unique_attributes :name, :scoped_to => :feed_id
	should_require_attributes :name, :feed_id
	should_have_many :posts
	should_belong_to :feed
	should_belong_to :user
  
  def test_recent_unassigned_contains_unassigned_author_feeds_ordered_by_created
    feed = feeds(:dirty_information)
    @no_user_af = AuthorFeed.create(:feed => feed, :name => "NoUser")
    @user_af = AuthorFeed.create(:feed => feed, :name => "NoUser", :user => users(:amos))
    assert_same_elements(AuthorFeed.recent_unassigned, [@no_user_af, author_feeds(:unassigned)])
  end
	
end
