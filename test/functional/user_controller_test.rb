require 'test_helper'

class UserControllerTest < ActionController::TestCase

#  should_route :get, "/user/amos", :action => :show, :id => "amos"

  context "given a user, show" do
    setup do
      get(:show, :id => users(:amos).name)
    end
    should_respond_with(:success)
    should_assign_to(:record, :with => "users(:amos)")
  end

end
