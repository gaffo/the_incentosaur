class AddFullEntryAndXpathToFeed < ActiveRecord::Migration
  def self.up
  	add_column(:feeds, :entry_xpath, :string, :null => false)
  	add_column(:posts, :full_post, :text)
  end

  def self.down
  	remove_column(:feeds, :entry_xpath)
  	remove_column(:posts, :full_post)
  end
end
