class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    # add custom create logic here
  end

    dfgd
  def update
    dgd
    @user = User.find(current_user)
    @user.update(user_params)
    flash[:notice] = "updated"

  end

  def user_params
    params.require(:user).permit(:avatar)
  end
end
