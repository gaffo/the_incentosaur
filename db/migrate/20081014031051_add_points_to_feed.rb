class AddPointsToFeed < ActiveRecord::Migration
  def self.up
  	add_column(:feeds, :points, :integer, :null => false, :default => 1)
  end

  def self.down
  	remove_column(:feeds, :points)
  end
end
