class AllocationsController < ApplicationController
  
  def new
  	@allocation = Allocation.new
    @songs = Song.all
  end

  def create
  	@allocation = Allocation.new(params[:allocation])
  	if @allocation.save
  		#success!
  		flash[:success] = "Songs added"
  		redirect_to setlists_path
  	else
  		#FAIL!
  		render 'new'
  	end
  end

  def destroy
    Allocation.find(params[:id]).destroy
    flash[:success] = "Song removed."
    redirect_to setlists_path
  end

  def index
  	@allocations = Allocation.all
  end
end
