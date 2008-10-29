require File.dirname(__FILE__) + "/../../test_helper"

class Admin::SettingsIntegrationTest < ActionController::IntegrationTest
  def test_index
    visits admin_url
    clicks_link("Settings")
  end
  
  def test_create_setting
    count = Setting.count
    visits admin_url
    clicks_link("Settings")
    clicks_link("Create New")
    fills_in("record[name]", :with => "NEWSETTING")
    fills_in("record[value]", :with => "value")
    clicks_button("Create")
    assert_equal(count + 1, Setting.count)
  end
  
  def test_analytics_block_shows_up_in_views
    value = "NONCE_VALUE"
    settings(:analytics).update_attributes(:value => value)
    visits(root_url)
    assert(@response.body.include?(value))
  end
  
end
