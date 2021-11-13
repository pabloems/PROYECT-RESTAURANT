class ApplicationController < ActionController::Base

  include ApplicationHelper

  before_action :authenticate_user!

  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :phone, :admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :phone, :phone])
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end


  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

end
