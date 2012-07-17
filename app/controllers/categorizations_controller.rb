class CategorizationsController < ApplicationController
  def new
  	@categorization = Categorization.new
    @song = Song.find(params[:id])
  end

  def create
  	@song = Song.find(params[:id])
  	@categorization = Category.new(params[:categorization])
  	if @categorization.save
  		#success!
  		flash[:success] = "Tag added!"
  		redirect_to song_path(@song)
  	else
  		#FAIL!
  		flash[:fail] = "TAG ERROR"
  		redirect_to edit_song_path(@song)
  	end
  end
end
