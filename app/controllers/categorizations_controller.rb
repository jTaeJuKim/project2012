class CategorizationsController < ApplicationController
  def new
  	@categorization = Categorization.new
  end

  def create
  	@categorization = Categorization.new(params[:categorization])
  	if @categorization.save
  		#success!
  		flash[:success] = "Tag added!"
  		redirect_to songs_path
  	else
  		#FAIL!
  		render 'new'
  	end
  end

  def destroy
    Categorization.find(params[:id]).destroy
    flash[:success] = "Tag removed from song"
    redirect_to categorizations_path
  end

  def index
    @categorizations = Categorization.all.sort_by{ |c| c.song.title }
  end
end
