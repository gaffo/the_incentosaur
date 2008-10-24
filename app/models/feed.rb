class Feed < ActiveRecord::Base
	has_many :posts, :dependent => :destroy, :order => "posted_date desc"
	validates_presence_of :name, :url, :idkey_xpath, :authorxpath, :full_postxpath, :points
	
  def automatic_xpaths
    attributes.keys.select{|k| k =~ /_xpath$/}.collect(&:to_sym)
  end
  
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
      p.delete(:author)
			hash = {:author_feed_id => author_feed.id,
			        :feed_id => self.id}.merge(p)
			Post.find_or_create_by_author_feed_idkey(hash)
		end
	end
	
	def pull_current_from_feed
		doc = pull_feed
		
		posts = []
		
		doc.elements.each(self.full_postxpath) do |entry|
			post = {:author => text_or_empty(entry.elements[self.authorxpath]),
			        :full_post => entry.to_s
		         }
      automatic_xpaths.each do |path_name|
        key = path_name.to_s.gsub(/_xpath$/, '').to_sym
        xpath = send(path_name)
        if xpath =~ /@/
          element_xpath = xpath.gsub(/@.*$/, '')
          attr_xpath = xpath.gsub(/^.+@/, '')
          value = value_or_empty(entry.elements[element_xpath].attribute(attr_xpath))
        else
          value = text_or_empty(entry.elements[xpath]) unless xpath =~ /@/
        end
        post[key] = value
      end
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

  def value_or_empty(attribute)
    return attribute.value if attribute
    ""
  end
	
end