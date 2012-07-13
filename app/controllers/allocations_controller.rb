class AllocationsController < ApplicationController
  
  def new
  	@allocation = Allocation.new
  end

  def create

  	@allocation = Allocation.new(params[:allocation])
    
  	if @allocation.save
  	 flash[:success] = "Songs added"
  		redirect_to edit_setlist_path(@allocation.setlist_id)
  	else
      flash[:fail] = "Error"
  		redirect_to edit_setlist_path(@allocation.setlist_id)
  	end
  end

  def destroy
    @allocation = Allocation.find(params[:id])

    @setlist = Setlist.find(@allocation.setlist_id)
    Allocation.find(params[:id]).destroy
    flash[:success] = "Song removed."
    redirect_to edit_setlist_path(@setlist)
  end

  def index
  	@allocations = Allocation.all
  end
end
