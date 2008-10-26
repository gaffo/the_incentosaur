require 'test_helper'

class FeedControllerTest < ActionController::TestCase

  context "not logged in" do
    context "index" do
      setup do
        get(:index)
      end
      should_respond_with :success
      should_assign_to(:feeds, :equals => "Feed.all_ordered_by_recent_count")
    end
    context "feed" do
      setup do
        get(:show, {:id => 1})
      end
      should_respond_with :success
      should_assign_to(:record, :equals => "Feed.find(1)")
    end
  end

end
