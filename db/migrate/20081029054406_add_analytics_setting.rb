class AddAnalyticsSetting < ActiveRecord::Migration
  def self.up
    execute("insert into settings (name, value) values ('#{Setting::ANALYTICS_BLOCK}', NULL)")
  end

  def self.down
    execute("delete from settings where name = '#{Setting::ANALYTICS_BLOCK}'")
  end
end
