class FriendshipsController < ApplicationController
  def index
  end

  def create
    @user = User.find(current_user)
    @post = Post.find(params[:post_id])
    @person_to_follow = User.find_by_id(@post.user_id)
    @friendship = Friendship.new(:person_id => @person_to_follow.id, :follower_id => @user.id)
    if @friendship.save
      flash[:notice] = "You are now following #{@person_to_follow.username}"
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    else
      root_path
      flash[:notice] = "something went wrong"
      redirect_to post_friendships_path(@post)
    end
  end


end
