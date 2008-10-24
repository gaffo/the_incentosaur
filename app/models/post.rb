class Post < ActiveRecord::Base
	belongs_to :feed
	belongs_to :author_feed
	named_scope :recent, { :conditions => ["posts.created_at > ?", Date.today - 7.days], :order => "posts.created_at desc"}
  validates_uniqueness_of :idkey, :scope => :feed_id
  validates_presence_of :author_feed_id, :feed_id, :idkey, :full_post
	
	def self.find_or_create_by_author_feed_idkey(args = {})
    conditions = {:idkey => args[:idkey],
                  :author_feed_id => args[:author_feed_id],
                  :feed_id => args[:feed_id]} 
		post = Post.find(:first, :conditions => conditions)
    if post
      post
    else
      Post.create(args)
    end
	end
end
