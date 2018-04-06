class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # authenticate user
  before_action :authenticate_user!, except: [:all, :dogs, :cats, :other]

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # additional permitted params for devise
  def configure_permitted_parameters
    added_attrs = [:name, :surname, :email, :password, :address, :phone_number, :city]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  def set_view
    render 'animals/home'
  end
end
