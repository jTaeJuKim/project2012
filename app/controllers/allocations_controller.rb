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
    @otherSongs = @setlist.allocations #find all other allocation records.


    Allocation.find(params[:id]).destroy

    #destroying an allocation effects the order of the songs

     @otherSongs.each do |n|

      if(n.songPosition > @allocation.songPosition)
        n.songPosition = n.songPosition - 1
        n.save!
      end
      
    end
    flash[:success] = "Song removed."
    redirect_to edit_setlist_path(@setlist)
  end

  def index
  	@allocations = Allocation.all
  end
end
