class AddColumnsToPosts < ActiveRecord::Migration
  def self.up
    add_column :posts, :posted_date, :datetime
    add_column :posts, :title, :string
    add_column :posts, :link, :string
    add_column :posts, :data, :text
  end

  def self.down
    remove_column :posts, :data
    remove_column :posts, :link
    remove_column :posts, :title
    remove_column :posts, :posted_date
  end
end
