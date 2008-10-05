class AddingIdAndAuthorXpathsToFeeds < ActiveRecord::Migration
  def self.up
  	add_column :feeds, :id_xpath, :string
  	add_column :feeds, :author_xpath, :string
  end

  def self.down
  	remove_column :feeds, :id_xpath
  	remove_column :feeds, :author_xpath
  end
end
