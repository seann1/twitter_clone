class CommentsController < ApplicationController
  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    @user = User.find(current_user)
  end

  def create
    @user = User.find(current_user)
    @post = Post.find(params[:post_id])
    @comment = Comment.new(comment_params)
    @comment.save(comment_params)
    render('comments/new')
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @comment.destroy
    redirect_to new_post_comment_path(:post_id => @post.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :post_id, :content)
  end
end
