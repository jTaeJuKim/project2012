class SetlistsController < ApplicationController
  def new
  	@setlist = Setlist.new
    @songs = Song.all
    @allocations = @setlist.allocations
  end

  def create
  	@setlist = Setlist.new(params[:setlist])
  	if @setlist.save
  		#success!
  		flash[:success] = "Setlist saved"
      #@setlist.allocations.build produce invalid allocation with nil id
  		redirect_to setlists_path
  	else
  		#FAIL!
  		render 'new'
  	end
  end

  def show
    @setlist = Setlist.find(params[:id])
    @setSongs = @setlist.songs
  end

  def edit
    @songs = Song.all(order: 'title')
    @setlist = Setlist.find(params[:id])
    @allocations = @setlist.allocations
  end

  def update
    #render :text => params.to_s and return
    @setlist = Setlist.find(params[:id])
    #song = Song.find(params[song_id])
    #@setlist.allocate!(song)
    if @setlist.update_attributes(params[:setlist])
      # Handle a successful update.
      flash[:success] = "SAVED!"
      redirect_to setlist_path(@setlist)
    else
      render 'edit'
    end
  end

  def index
    @setlists = Setlist.all
  end

  def destroy
    Setlist.find(params[:id]).destroy
    flash[:success] = "Setlist deleted."
    redirect_to setlists_path
  end

end
