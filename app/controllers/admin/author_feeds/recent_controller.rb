class Admin::AuthorFeeds::RecentController < Admin::AdminBaseController
  def show
    @author_feeds = AuthorFeed.recent_unassigned
  end
end
