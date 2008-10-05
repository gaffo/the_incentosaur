require File.dirname(__FILE__) + "/../test_helper"

class FeedTest < ActiveSupport::TestCase

	should_require_attributes :name, :url

end
