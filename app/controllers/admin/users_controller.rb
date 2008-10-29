class Admin::UsersController < Admin::AdminBaseController
	active_scaffold :user do |config|
    config.list.columns = [:name, :is_admin, :author_feeds] 
    config.create.columns = [:name, :email, :is_admin, :password]
    config.update.columns = [:name, :email, :is_admin, :password]
		config.columns.exclude :created_at, :updated_at
		config.columns[:author_feeds].form_ui = :select
	end
end
