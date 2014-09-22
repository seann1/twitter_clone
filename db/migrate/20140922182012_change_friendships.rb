class ChangeFriendships < ActiveRecord::Migration
  def change
    remove_column :friendships, :follower
    remove_column :friendships, :followee
    add_column :friendships, :follower_id, :integer
    add_column :friendships, :followee_id, :integer
  end
end
