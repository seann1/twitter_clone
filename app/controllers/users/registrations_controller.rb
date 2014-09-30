class Users::RegistrationsController < Devise::RegistrationsController

  before_filter :configure_permitted_parameters

  fsdfsdf

  protected

  # my custom fields are :name, :heard_how
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:avatar,
        :email, :password, :password_confirmation, :current_password)
    end
  end
end