class SetlistsController < ApplicationController
  def new
  	@setlist = Setlist.new
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

  def edit
    @songs = Song.all
    @setlist = Setlist.find(params[:id])
    @currentSet = @setlist.songs.collect{|s| [s.title, s.artist, s.key] }
  end

  def update
    @setlist = Setlist.find(params[:id])
    if @setlist.update_attributes(params[:setlist])
      # Handle a successful update.
      flash[:success] = "SAVED!"
      redirect_to setlists_path
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
