class Admin::SettingsController < Admin::AdminBaseController
  active_scaffold :setting do |config|
  end
end
