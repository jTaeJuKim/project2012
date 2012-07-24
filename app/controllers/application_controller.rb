class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  #this filter is used throughout the app to ensure that only signed in users can view pages

  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy]
 

  private
  #if user isn't signed in this will redirect them to do so
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "No unauthorized access. Please sign in."
      end
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end


end
