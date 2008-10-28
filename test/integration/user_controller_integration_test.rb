require 'test_helper'

class UserControllerIntegrationTest < ActionController::IntegrationTest

  def test_can_get_to_user_page_from_sidebar_links
    user = users(:amos)
    visits(root_url)
    clicks_link("#{user.name}: #{user.points}")
    assert_equal(user_url(user.name), @request.url)
  end
  
  context 'A user with a . in the username' do
    setup do
      @user = users(:period)
      visits(root_url)
      clicks_link("#{@user.name}: #{@user.points}")
    end
    
    should_respond_with :success
    
    should 'still be reachable' do
      assert_equal(user_url(@user.name), @request.url)
      assert_tag :tag => 'h1', :content => @user.name
    end
  end
end
