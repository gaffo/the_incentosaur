class FeedController < ApplicationController
  def show
  	@record = Feed.find(params[:id])
  end
end
