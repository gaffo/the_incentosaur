require 'test_helper'

class AdminControllerTest < ActionController::TestCase

  context "index" do
    setup do
      get(:show)
    end
    should_respond_with :success
  end
  
end
