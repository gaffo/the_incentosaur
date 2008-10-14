class HomeController < ApplicationController
	def index
		@feeds = Feed.find(:all)
		@top_authors = User.find(:all)
	end
end
