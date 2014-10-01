class CommentLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :comment
  before_save :check_for_uniqueness

  def check_for_uniqueness
    @likes = CommentLike.all

    @likes.each do |like|
      if like.user_id == self.user_id && like.comment_id == self.comment_id
        false
        break
      else
        true
      end
    end
  end
end