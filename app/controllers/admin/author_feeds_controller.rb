class Admin::AuthorFeedsController < Admin::AdminBaseController
	active_scaffold :author_feed do |config|
		config.actions = [:list, :update, :search]
		config.columns = [:user, :feed, :name]
		config.update.columns = [:user]
		config.columns[:user].form_ui = :select
	end
end
