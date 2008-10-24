class AlignXpathColumnsWithFields < ActiveRecord::Migration
  def self.up
    rename_column :feeds, :id_xpath, :idkey_xpath
    rename_column :feeds, :entry_xpath, :full_post_xpath
    rename_column :feeds, :author_xpath, :authorxpath
  end

  def self.down
    rename_column :feeds, :idkey_xpath, :id_xpath
    rename_column :feeds, :full_post_xpath, :entry_xpath
    rename_column :feeds, :authorxpath, :author_xpath
  end
end
