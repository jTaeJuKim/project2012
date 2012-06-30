class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper

  before_filter :signed_in_user, only: [:edit, :update, :index, :destroy]
 

    private
  #if user isn't signed in this will redirect them to do so
    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_path, notice: "No unauthorized access. Please sign in."
      end
    end


end
