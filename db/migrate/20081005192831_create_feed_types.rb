class CreateFeedTypes < ActiveRecord::Migration
  def self.up
    create_table :feed_types do |t|
	  t.string :name, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :feed_types
  end
end
