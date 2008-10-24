class MakeEntryXpathNotAuto < ActiveRecord::Migration
  def self.up
    rename_column :feeds, :full_post_xpath, :full_postxpath
  end

  def self.down
    rename_column :feeds, :full_postxpath, :full_post_xpath
  end
end
