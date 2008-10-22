class HomeController < ApplicationController
	def index
		@feeds = Feed.find(:all)
		@top_authors = User.find(:all).sort{|a,b| b.points <=> a.points}
	end
end
