class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.column :follower, :string
      t.column :followee, :string

      t.timestamps
    end
  end
end
