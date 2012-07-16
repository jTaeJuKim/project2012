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
    @songs= Song.search(params[:search])
    #@songs = Song.all(order: 'title')
    @setlist = Setlist.find(params[:id])
    @allocations = @setlist.allocations
    @allocation = Allocation.new
    @selections = Song.all.collect {|s| [ [s.title, s.artist].join(" by "), s.id ]}
  end


  def update
    
    @setlist = Setlist.find(params[:id])
    @selections = Song.all.collect {|s| [ [s.title, s.artist].join(" by "), s.id] }
    @allocations = @setlist.allocations
    @allocation = Allocation.new

    @allocation.song_id = params[:allocation][:song_id]
    @allocation.setlist_id = @setlist.id

    if @setlist.update_attributes(params[:setlist])
      if @allocation.save
        flash[:success] = "SETLIST SAVED!"
        redirect_to edit_setlist_path(@setlist)
      else
        flash[:fail] = "Setlist not saved"
        render 'edit'
      end
    else
      flash[:fail] = "FAIL!"
      render 'edit'
    end
  end

  def index
    #@setlists = Setlist.all(order: 'date')
    #show most recent setlist first
    @setlists = Setlist.order("date DESC")
  end

  def destroy
    Setlist.find(params[:id]).destroy
    flash[:success] = "Setlist deleted."
    redirect_to setlists_path
  end

end
