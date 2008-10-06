class CreateAuthorFeeds < ActiveRecord::Migration
  def self.up
    create_table :author_feeds do |t|
	  t.string :name, :null => false
	  t.integer :feed_id, :null => false
      t.timestamps
    end
	add_index(:author_feeds, [:name, :feed_id], :unique => true, :name => 'unique_author_feed')
  end

  def self.down
    drop_table :author_feeds
  end
end
