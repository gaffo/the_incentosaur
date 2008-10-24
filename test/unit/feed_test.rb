require File.dirname(__FILE__) + "/../test_helper"

class FeedTest < ActiveSupport::TestCase

	should_require_attributes :name, :url, :idkey_xpath, :authorxpath, :full_postxpath, :points
	should_have_many :posts

  COMPLETE_PARAMS = {:name => "name", 
                     :url => "boogers", 
                     :full_postxpath => "//entry",
                     :idkey_xpath => 'id', 
                     :authorxpath => 'author/name', 
                     :points => 3}

  context "pull feed" do
    setup do
      feed = Feed.create(COMPLETE_PARAMS)
      xml = load_xml_file("dirty_info.feed.xml")
      feed.expects(:load_feed_from_html).returns(xml)
      @doc = feed.send(:pull_feed)
    end
    
    should "create rexml doc" do
      assert_not_nil(@doc)
      assert_equal(REXML::Document, @doc.class)
    end
  end

  context "pull_curent_from_feed" do
    setup do
      feed = Feed.create(COMPLETE_PARAMS)
      feed.expects(:load_feed_from_html).returns(load_xml_file("dirty_info.feed.xml"))
      @posts = feed.pull_current_from_feed
    end
    
    should "create hashes for entries in feed" do
      assert_equal(10, @posts.size)
    end
  end
  
  context "pull_curent_from_feed" do
    setup do
      feed = Feed.create(COMPLETE_PARAMS)
      feed.expects(:load_feed_from_html).returns(load_xml_file("dirty_info.feed.xml"))
      feed.load_current_from_feed
    end
    should_change "Post.count", :by => 10
    should_change "AuthorFeed.count", :by => 1
  end
  
  def load_xml_file(filename)
    filename = File.dirname(__FILE__) + "/../fixtures/#{filename}"
    File.open(filename) do |f|
      return f.read
    end
  end
end
