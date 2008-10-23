require 'test_helper'

class Admin::PullControllerTest < ActionController::TestCase
  context 'GET to the index' do
    setup do
      Feed.expects(:load_all_feeds)
      get :index
    end
    
    should_respond_with :success
  end
  
  context 'Get to show' do
    setup do
      @feed = Feed.find(:first)
      Feed.any_instance.expects(:load_current_from_feed)
      get :show, :id => @feed.id
    end
    
    should_respond_with :success
  end
end
