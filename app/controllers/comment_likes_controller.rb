class CommentLikesController < ApplicationController
  def new
    @comment_like = CommentLike.new
    respond_to do |format|
        format.html { redirect_to root_url }
        format.js
    end
  end

  def create
    @user = User.find(current_user)
    @comment = Comment.find(params[:comment_id])
    @comment_like = CommentLike.new(:comment_id => @comment.id, :user_id => @user.id)
    if @comment_like.check_for_uniqueness
      @comment_like.save
      redirect_to new_post_comment_path(@comment.post_id)
    else
      redirect_to new_post_comment_path(@comment.post_id)
    end
  end

  private

  def comment_like_params
     params.require(:comment_like).permit(:user_id, :comment_id)
  end

end
