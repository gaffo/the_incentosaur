class Admin::FeedsController < Admin::AdminBaseController
	active_scaffold :feed do |config|
	end
	
	def show
		@record = Feed.find(params[:id])
		@values = @record.pull_current_from_feed
	end
end
