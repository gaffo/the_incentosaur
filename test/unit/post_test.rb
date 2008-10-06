require File.dirname(__FILE__) + "/../test_helper"
class PostTest < ActiveSupport::TestCase
	
	# should_require_attributes :name,
	should_belong_to :feed
	should_belong_to :author_feed

	context 'recent posts' do
	    setup do
	    	@scoped_find = Post.recent()
	    end
	
	    should "have condition recent" do
	      expected_conditions  = {:conditions => ["created_at > ?", Date.today - 7.days]}
	      assert_equal expected_conditions, @scoped_find.proxy_options
	    end
  	end
end
