class HomeController < ApplicationController
	def index
		@recent_posts = Post.recent
		@top_authors = User.find(:all).sort{|a,b| b.points <=> a.points}
	end
end
