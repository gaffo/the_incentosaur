require File.dirname(__FILE__) + "/../test_helper"

class HomeControllerTest < ActionController::TestCase
  
	context "given anyone" do
		setup do
			get(root_url)
		end
		should_respond_with :success
		should_assign_to :feeds
	end
end
