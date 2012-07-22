class SetlistsController < ApplicationController
  def new
  	@setlist = Setlist.new
  end

  def create
  	@setlist = Setlist.new(params[:setlist])
  	if @setlist.save
  		#success!
  		flash[:success] = "Setlist saved"
  		redirect_to setlist_path(@setlist)
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
    #@songs= Song.search(params[:search])
    @songs = Song.all(order: 'title')
    @setlist = Setlist.find(params[:id])
    @allocations = @setlist.allocations
    @allocation = Allocation.new
    @selections = Song.all.collect {|s| [ [s.title, s.artist].join(" by "), s.id ]}

    #recommender stuff
    if @allocations.last != nil
      @data = @allocations.last.song_id #this will be used as input data for now
   
      #find all setlists that contain a specified song
      @commonAllocations = Allocation.select(:setlist_id).where("song_id = ?", @data).map &:setlist_id
      @commonSetlists = Setlist.find(@commonAllocations)
      
    end
    

    #find all songs contained in these setlists.
  
  end


  def update
    
    @setlist = Setlist.find(params[:id])
    @selections = Song.all.collect {|s| [ [s.title, s.artist].join(" by "), s.id] }
    @allocations = @setlist.allocations
    @allocation = Allocation.new

    #Allocation parameters
    @allocation.song_id = params[:allocation][:song_id]
    @allocation.setlist_id = @setlist.id
    @allocation.position = @setlist.songs.count + 1

    if @setlist.update_attributes(params[:setlist])
      if @allocation.save
        flash[:success] = "SETLIST SAVED!"
        redirect_to edit_setlist_path(@setlist)
      else
        flash[:fail] = "Sorry there was an error adding songs to the setlist"
        render 'edit'
      end
    else
      flash[:fail] = "Invalid Set"
      render 'edit'
    end
  end

  def index
    #show most recent setlist first
    @setlists = Setlist.order("date DESC")
  end

  def destroy
    Setlist.find(params[:id]).destroy
    flash[:success] = "Setlist deleted."
    redirect_to setlists_path
  end

end
