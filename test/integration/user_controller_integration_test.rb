require 'test_helper'

class UserControllerIntegrationTest < ActionController::IntegrationTest

  def test_can_get_to_user_page_from_sidebar_links
    user = users(:amos)
    visits(root_url)
    clicks_link("#{user.name}: #{user.points}")
    assert_equal(user_url(user.name), @request.url)
  end

end
