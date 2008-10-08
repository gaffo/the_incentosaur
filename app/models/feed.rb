class Feed < ActiveRecord::Base
	has_many :posts
	validates_presence_of :name, :url, :id_xpath, :author_xpath, :entry_xpath
	
	def self.load_all_feeds
		Feed.find(:all).each do |f|
		 	f.load_current_from_feed	
		end
	end
	
	def load_current_from_feed
		pull_current_from_feed.each do |p|
			next unless p[:author]
			author = AuthorFeed.find_or_create_by_feed_id_and_name(self.id, p[:author])
			author.save!
			post = Post.find_or_create_by_author_feed_idkey(
							author,
							self,
							p[:idkey])
			post.save!
		end
	end
	
	def pull_current_from_feed
		doc = pull_feed
		
		ids = []
		authors = []
		
		doc.elements.each(self.id_xpath){|e| ids << e.text}
		doc.elements.each(self.author_xpath){|a| authors << a.text}
		
		values = []
		for i in 0..(ids.size - 1)
			values[i] = {:idkey => ids[i], :author => authors[i]}
		end
		values
	end
	
	protected
	def pull_feed
		REXML::Document.new(Net::HTTP.get_response(URI.parse(self.url)).body)
	end
	
end