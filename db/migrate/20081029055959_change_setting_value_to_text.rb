class ChangeSettingValueToText < ActiveRecord::Migration
  def self.up
    change_column(:settings, :value, :text)
  end

  def self.down
    change_column(:settings, :value, :string)
  end
end
