class AddPasswordAndIsAdminToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :password, :string, :null => false, :default => ''
    add_column :users, :is_admin, :boolean, :null => false, :default => false
  end

  def self.down
    remove_column :users, :is_admin
    remove_column :users, :password
  end
end
