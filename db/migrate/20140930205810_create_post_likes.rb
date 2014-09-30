class CreatePostLikes < ActiveRecord::Migration
  def change
    create_table :post_likes do |t|
      t.column :user_id, :integer
      t.column :post_id, :integer
      t.timesta
    end
  end
end
