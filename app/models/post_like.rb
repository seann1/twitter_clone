class PostLike < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  before_save :check_for_uniqueness

  def check_for_uniqueness
    @likes = PostLike.all

    @likes.each do |like|
      if like.user_id == self.user_id && like.post_id == self.post_id
        false
      else
        true
      end
    end
  end
end
