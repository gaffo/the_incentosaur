class AddColumnsToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :posted_date, :datetime
    add_column :posts, :title, :text
    add_column :posts, :link, :text
    add_column :posts, :data, :text
  end

  def self.down
    remove_column :posts, :data
    remove_column :posts, :link
    remove_column :posts, :title
    remove_column :posts, :posted_date
  end
end
