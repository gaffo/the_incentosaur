require File.dirname(__FILE__) + "/../test_helper"

class HomeControllerTest < ActionController::TestCase
  
	context "given anyone" do
		setup do
			get(:index)
		end
		should_respond_with :success
		should_assign_to :recent_posts, :equals => "Post.recent"
		should_assign_to :top_authors
	end
end
