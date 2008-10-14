require File.dirname(__FILE__) + "/../test_helper"

class FeedTest < ActiveSupport::TestCase

	should_require_attributes :name, :url, :id_xpath, :author_xpath, :entry_xpath, :points
	should_have_many :posts
	
end
