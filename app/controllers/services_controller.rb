class ServicesController < ApplicationController
  def new
  	@service = Service.new
  end

  def create
  	@service = Service.new(params[:service])
  	if @service.save
  		#success!
  		flash[:success] = "Service added!"
  		redirect_to root_path
  	else
  		#FAIL!
  		render 'new'
  	end
  end

  def show
  	@service = Service.find(params[:id])
  end

  def index
  	@services = Service.all
  end

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update_attributes(params[:service])
      # Handle a successful update.
      flash[:success] = "Service updated"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    Service.find(params[:id]).destroy
    flash[:success] = "Service plan deleted."
    redirect_to root_path
  end
  
end
