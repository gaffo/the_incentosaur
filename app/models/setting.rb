class Setting < ActiveRecord::Base
  
  ANALYTICS_BLOCK = "ANALYTICS_BLOCK"
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  def self.get(setting_name)
    return nil unless Setting.exists?(:name => setting_name)
    return Setting.find(:first, :conditions => {:name => setting_name}).value
  end
end
