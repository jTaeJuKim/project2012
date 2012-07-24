class SongsController < ApplicationController

  before_filter :admin_user, only: [:edit, :update, :destroy]


  def ccli
    #select all songs which have been created this year
    @returns = Song.where("created_at > ?", Date.today - 365).order('title')
  end

  def new
  	@song = Song.new
  end

  def destroy
    Song.find(params[:id]).destroy
    flash[:success] = "Song deleted."
    redirect_to songs_path
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update_attributes(params[:song])
      flash[:success] = "Changes saved!"
      redirect_to songs_path
    else
      flash[:fail] = "Error"
      render 'edit'
    end
  end

  def index
    @songs= Song.search(params[:search])
  end

  def create
  	@song = Song.new(params[:song])
  	if @song.save
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
