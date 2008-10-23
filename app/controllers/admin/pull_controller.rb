class Admin::PullController < Admin::AdminBaseController
  def index
    Feed.load_all_feeds
    render :text => "done"
  end
end
