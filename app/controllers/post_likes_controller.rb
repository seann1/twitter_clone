class PostLikesController < ApplicationController
  def new
    @post_like = PostLike.new
    respond_to do |format|
        format.html { redirect_to root_url }
        format.js
    end
  end

  def create
    @user = User.find(current_user)
    @post = Post.find(params[:post_id])
    @post_like = PostLike.new(:post_id => @post.id, :user_id => @user.id)
    if @post_like.check_for_uniqueness
        @post_like.save
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  private

   def post_like_params
    params.require(:post_like).permit(:user_id, :post_id)
  end

end
