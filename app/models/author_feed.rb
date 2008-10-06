class AuthorFeed < ActiveRecord::Base
	validates_presence_of :name
	validates_presence_of :feed_id
	validates_uniqueness_of :name, :scope => :feed_id
	has_many :posts
	belongs_to :feed
end
