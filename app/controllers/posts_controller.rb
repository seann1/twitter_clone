class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    respond_to do |format|
        format.html { redirect_to root_url }
        format.js
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created"
      respond_to do |format|
        format.html { redirect_to root_url }
        format.js
      end
    else
      flash[:notice] = "Invalid post"
    end
  end

  def show
    @posts = Post.all
    @post = Post.find(params[:id])
    @user = User.find_by_id(@post.user_id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:notice] = "Post updated"
      redirect_to root_path
    else
      flash[:notice] = "Post not updated"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "Your post has been deleted"
    redirect_to root_path
  end


private

  def post_params
    params.require(:post).permit(:user_id, :body)
  end
end
