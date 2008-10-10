class Post < ActiveRecord::Base
	belongs_to :feed
	belongs_to :author_feed
	named_scope :recent, { :conditions => ["created_at > ?", Date.today - 7.days]}
	
	def self.find_or_create_by_author_feed_idkey(author, feed, idkey, full_post)
		record = Post.exists?(:author_feed_id => author.id,
							  :feed_id => feed.id,
							  :idkey => idkey)
		return record if record
		post = Post.create(:author_feed => author,
						  	:feed => feed,
						  	:idkey => idkey,
						  	:full_post => full_post)
		return post
	end
end
