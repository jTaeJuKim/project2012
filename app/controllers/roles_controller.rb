class RolesController < ApplicationController

  #before_filter :signed_in_user
  
  def new
  	@role = Role.new
  end

  def create
  	@role = Role.new(params[:role])
  	if @role.save
  		#success!
  		flash[:success] = "Role has been added"
  		redirect_to roles_path
  	else
  		#FAIL!
  		render 'new'
  	end
  end

  def destroy
    Role.find(params[:id]).destroy
    flash[:success] = "Role deleted."
    redirect_to roles_path
  end

  def show
  	@role = Role.find(params[:id])
  end

  def index
  	@roles = Role.all
  end
end

private
#if user isn't signed in this will redirect them to do so
  #def signed_in_user
   #unless signed_in?
        #store_location
        #redirect_to signin_path, notice: "No unauthorized access. Please sign in."
      #end
    #end
