class AddXpathsToFeedForNewColumns < ActiveRecord::Migration
  def self.up
    add_column :feeds, :posted_date_xpath, :string
    add_column :feeds, :title_xpath, :string
    add_column :feeds, :link_xpath, :string
    add_column :feeds, :data_xpath, :string
  end

  def self.down
    remove_column :feeds, :posted_date_xpath
    remove_column :feeds, :title_xpath
    remove_column :feeds, :link_xpath
    remove_column :feeds, :data_xpath
  end
end
