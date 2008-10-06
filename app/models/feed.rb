class Feed < ActiveRecord::Base
	has_many :posts
	validates_presence_of :name, :url
	
	def self.load_all_feeds
		Feed.find(:all).each do |f|
			puts "Loading Feed: #{f.name}:#{f.id}"
		 	f.load_current_from_feed	
		end
	end
	
	def load_current_from_feed
		pull_current_from_feed.each do |p|
			next unless p[:author]
			puts "#{p[:author]}, #{p[:idkey]}"
			conditions =  {:name => p[:author], 
						   :feed_id => self.id}
			if AuthorFeed.exists?(conditions)
				author = AuthorFeed.find(:first, :conditions => conditions)
			else	
				author = AuthorFeed.create(:name => p[:author],
										   :feed_id => self.id)
				author.save!
			end
			post = Post.new(:idkey => p[:idkey], 
										:author_feed_id => author.id,
										:feed_id => self.id)
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