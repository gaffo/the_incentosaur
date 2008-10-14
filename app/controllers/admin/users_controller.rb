class Admin::UsersController < Admin::AdminBaseController
	active_scaffold :user do |config|
		config.columns.exclude :created_at, :updated_at
		config.columns[:author_feeds].form_ui = :select
	end
end
