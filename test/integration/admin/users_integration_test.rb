require 'test_helper'

class Admin::UsersIntegrationTest < ActionController::IntegrationTest
	
	def test_index
    visits admin_url
    clicks_link("Users")
	end
	
end
