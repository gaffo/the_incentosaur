require File.dirname(__FILE__) + "/../test_helper"
=begin
t.integer  "feed_id",        :null => false
t.integer  "author_feed_id", :null => false
t.string   "idkey",          :null => false
t.datetime "created_at"
t.datetime "updated_at"
t.text     "full_post"
=end
class PostTest < ActiveSupport::TestCase
  
  COMPLETE_POST = {:feed_id => 1, :author_feed_id => 1, :idkey => '1', :full_post => 'foo'}
  
  def setup
    @post = Post.create!(COMPLETE_POST)
  end
	
	# should_require_attributes :name,
	should_belong_to :feed
	should_belong_to :author_feed
	should_require_unique_attributes :idkey, :scoped_to => :feed_id

	context 'recent posts' do
	    setup do
	    	@scoped_find = Post.recent
	    end
	
	    should "have condition recent" do
	      expected_conditions  = {:conditions => ["posts.created_at > ?", Date.today - 7.days], :order => "posts.created_at desc"}
	      assert_equal expected_conditions, @scoped_find.proxy_options
	    end
  	end
  	
  context "find_or_create non existing post" do
    setup do
      Post.find_or_create_by_author_feed_idkey(COMPLETE_POST.merge({:idkey => '2'}))
    end
    
    should_change "Post.count", :by => 1
  end
  
  context "find_or_create existing post" do
    setup do
      Post.find_or_create_by_author_feed_idkey(COMPLETE_POST)
    end
    
    should_not_change "Post.count"
  end
end
