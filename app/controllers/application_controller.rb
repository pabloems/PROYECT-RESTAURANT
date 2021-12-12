class ApplicationController < ActionController::Base

  include Pagy::Backend
  include ApplicationHelper

  before_action :authenticate_user!
    before_action :set_q

  helper_method :resource_name, :resource, :devise_mapping, :resource_class

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :phone, :admin])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name, :phone, :phone])
  end


  private

  def set_q
    @q = Product.ransack(params[:q])
  end

end
