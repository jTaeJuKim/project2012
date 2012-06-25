class SongsController < ApplicationController
  def new
  	@song = Song.new
  end

  def index
    @songs = Song.all(order: 'title')
  end

  def create
  	@song = Song.new(params[:song])
  	if @song.save
  		#success!
  		flash[:success] = "Song successfully added to library"
  		redirect_to @song
  	else
  		#FAIL!
  		render 'new'
  	end
  end

  def show
  	@song = Song.find(params[:id])
  end
end
