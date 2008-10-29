require File.dirname(__FILE__) + "/../test_helper"

class SettingTest < ActiveSupport::TestCase
  should_require_attributes :name
  should_require_unique_attributes :name
  
  def test_get_setting_by_value
    assert_nil(Setting.get("UNKNOWN"))
    Setting.create(:name => "newname", :value => "newvalue")
    assert_not_nil(Setting.get("newname"))
    assert_equal("newvalue", Setting.get("newname"))
  end
  
  def test_setting_analytics_shows_up_on_view_pages
    
  end
end
