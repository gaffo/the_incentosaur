class Admin::PullController < ApplicationController
  def index
    Feed.load_all_feeds
    render :text => "done"
  end
end
