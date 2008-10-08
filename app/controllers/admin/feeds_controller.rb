class Admin::FeedsController < Admin::AdminBaseController
	active_scaffold :feed do |config|
		config.columns.exclude :posts
	end
	
	def show
		@record = Feed.find(params[:id])
		@values = @record.pull_current_from_feed
	end
end
