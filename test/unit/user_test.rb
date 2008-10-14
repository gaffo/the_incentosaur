require 'test_helper'

class UserTest < ActiveSupport::TestCase

	should_require_attributes :name
	should_have_many :author_feeds

end
