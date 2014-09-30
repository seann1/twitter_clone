class UsersController < ApplicationController

  def show
    @posts = Post.where(:user_id => @user.id)
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:avatar)
  end

end
