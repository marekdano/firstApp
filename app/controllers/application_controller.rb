class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_url, :alert => exception.message
  end

  before_filter :store_action

  def store_action
    return unless request.get? 
    if (request.path != "/login" &&
        request.path != "/logout" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/sign_up" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:user, request.fullpath)
    end
  end

  def after_sign_in_path_for(resource)
    #logger.debug "stored_location_for(:user): #{stored_location_for(:user)}"
    stored_location_for(:user) || root_path
  end

  def after_sign_out_path_for(resource_or_scope)
    request.referrer || root_path
  end

end
