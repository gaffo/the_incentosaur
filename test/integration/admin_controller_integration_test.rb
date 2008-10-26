require 'test_helper'

class AdminControllerIntegrationTest < ActionController::IntegrationTest

  def test_can_get_to_admin_home
    visits(admin_url)
  end
  
end
