class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    # add custom create logic here
  end

  def update
    @user = User.find(current_user)
    @user.update(user_params)
    flash[:notice] = "updated"
  end
  
  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end
