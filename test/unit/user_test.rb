require 'test_helper'

class UserTest < ActiveSupport::TestCase
	fixtures :users

	should_require_attributes :name
	should_have_many :author_feeds
  should_have_many :posts, :through => :author_feeds
	
	def test_points
		user = users(:amos)
		assert(user.respond_to?(:points))
		assert_equal(1, user.points)
	end

end
