class AddUserToAuthorFeed < ActiveRecord::Migration
  def self.up
	add_column(:author_feeds, :user_id, :integer)
  end

  def self.down
  	remove_column(:author_feeds, :user_id)
  end
end
