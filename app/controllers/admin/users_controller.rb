class Admin::UsersController < Admin::AdminBaseController
	active_scaffold :user do |config|
    config.list.columns = [:name, :is_admin, :author_feeds] 
		config.columns.exclude :created_at, :updated_at
		config.columns[:author_feeds].form_ui = :select
	end
end
