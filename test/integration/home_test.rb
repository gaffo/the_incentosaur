require File.dirname(__FILE__) + "/../test_helper"

class HomeTest < ActionController::IntegrationTest
	
	def test_home 
      visits "/"
      assert_response :success
	end
	
end