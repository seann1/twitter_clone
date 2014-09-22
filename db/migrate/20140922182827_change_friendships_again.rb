class ChangeFriendshipsAgain < ActiveRecord::Migration
  def change
    remove_column :friendships, :followee_id
    add_column :friendships, :person_id, :integer
    add_column :friendships, :blocked, :boolean
  end
end
