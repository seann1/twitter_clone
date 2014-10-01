class CreateCommentLikes < ActiveRecord::Migration
  def change
    create_table :comment_likes do |t|
      t.column :comment_id, :integer
      t.column :user_id, :integer
      t.timestamps
    end
  end
end
