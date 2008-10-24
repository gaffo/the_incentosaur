class AddDefaultXpaths < ActiveRecord::Migration
  def self.up
    Feed.find(:all).each do |feed|
      feed.posted_date_xpath = 'published'
      feed.title_xpath = 'title'
      feed.link_xpath = 'link@href'
      feed.data_xpath = 'content'
    end
  end

  def self.down
  end
end
