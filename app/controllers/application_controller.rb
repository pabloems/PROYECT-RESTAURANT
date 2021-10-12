class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  helper_method :resource_name, :resource, :devise_mapping, :resource_class
  

end
