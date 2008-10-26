require 'test_helper'

class Admin::AuthorFeeds::RecentControllerTest < ActionController::TestCase

  context "admin user request to recent feeds" do
    setup do
      feed = feeds(:dirty_information)
      @no_user_af = AuthorFeed.create(:feed => feed, :name => "NoUser")
      @user_af = AuthorFeed.create(:feed => feed, :name => "NoUser", :user => users(:amos))
      get(:show)
      
    end
    should_respond_with(:success)
    should_assign_to(:author_feeds, :equals => "AuthorFeed.recent_unassigned")
  end

end
