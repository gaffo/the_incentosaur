class AuthorFeed < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :feed_id
	validates_uniqueness_of :name, :scope => :feed_id
	has_many :posts
	belongs_to :feed
	belongs_to :user
  
  def self.recent_unassigned
    AuthorFeed.all(:conditions => {:user_id => nil}, :order => ["created_at desc"])
  end
end
