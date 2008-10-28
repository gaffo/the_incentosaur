class User < ActiveRecord::Base
  is_gravtastic :rating => 'G'
	validates_presence_of :name
	has_many :author_feeds
  has_many :posts, :through => :author_feeds, :order => ["posted_date desc"]
	
	def points
		points = 0
		author_feeds.each do |af|
			af.posts.each do |f|
				points = points + f.feed.points
			end
		end
		points
	end
end