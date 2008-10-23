class Admin::FeedsController < Admin::AdminBaseController
	active_scaffold :feed do |config|
		config.columns.exclude :posts
		config.action_links.add 'Pull All Now!', :controller => 'Pull', :action => 'index', :position => :top
		config.action_links.add 'Pull', :controller => 'Pull', :action => 'show', :position => :after, :type => :record
	end
	
	def show
		@record = Feed.find(params[:id])
		@values = @record.pull_current_from_feed
	end
end
