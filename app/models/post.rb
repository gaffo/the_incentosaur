class Post < ActiveRecord::Base
	belongs_to :feed
	belongs_to :author_feed
	named_scope :recent, { :conditions => ["created_at > ?", Date.today - 7.days]}
end
