class FeedController < ApplicationController
  def show
  	@record = Feed.find(params[:id])
  end
 
  def index
    @feeds = Feed.all_ordered_by_recent_count
  end
end
