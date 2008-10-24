class Feed < ActiveRecord::Base
	has_many :posts
	validates_presence_of :name, :url, :idkey_xpath, :authorxpath, :full_post_xpath, :points
	
	def self.load_all_feeds
		Feed.find(:all).each do |f|
			begin
		 		f.load_current_from_feed	
	 		rescue => e
	 			puts e
 			end
		end
	end
	
	def load_current_from_feed
		pull_current_from_feed.each do |p|
			next if p[:author].empty?
			author_feed = AuthorFeed.find_or_create_by_feed_id_and_name(self.id, p[:author])
			author_feed.save!
			hash = {:idkey => p[:idkey], 
			        :full_post => p[:full_post], 
			        :author_feed_id => author_feed.id,
			        :feed_id => self.id}
			Post.find_or_create_by_author_feed_idkey(hash)
		end
	end
	
	def pull_current_from_feed
		doc = pull_feed
		
		posts = []
		
		doc.elements.each(self.full_post_xpath) do |entry|
			post = {:idkey => text_or_empty(entry.elements[self.idkey_xpath]),
			        :author => text_or_empty(entry.elements[self.authorxpath]),
			        :full_post => entry.to_s
		}
			posts << post
		end
		posts
	end
	
	protected
	def pull_feed
		REXML::Document.new(load_feed_from_html)
	end
	
	def load_feed_from_html
	  Net::HTTP.get_response(URI.parse(self.url)).body
	end
	
	def text_or_empty(element)
		return element.text if element
		""
	end
	
end