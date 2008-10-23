class Admin::PullController < Admin::AdminBaseController
  def index
    Feed.load_all_feeds
    render :text => "done"
  end
  
  def show
    Feed.find(params[:id]).load_current_from_feed
    render :text => 'done'
  end
end
