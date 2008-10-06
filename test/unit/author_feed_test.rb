require File.dirname(__FILE__) + "/../test_helper"
class AuthorFeedTest < ActiveSupport::TestCase
	
	# should_require_unique_attributes :name, :scoped_to => :feed_id
	should_require_attributes :name, :feed_id
	should_have_many :posts
	should_belong_to :feed
	
end
