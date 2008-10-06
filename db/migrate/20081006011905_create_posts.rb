class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
	  t.integer :feed_id, :null => false
	  t.integer :author_feed_id, :null => false
	  t.string :idkey, :null => false
      t.timestamps
    end
	add_index(:posts, [:feed_id, :idkey], :unique => true, :name => 'unique_post_feed_and_idkey')
  end

  def self.down
    drop_table :posts
  end
end
