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
  
end
