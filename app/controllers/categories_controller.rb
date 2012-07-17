class CategoriesController < ApplicationController
  def new
  	@category = Category.new
  end

  def create
  	@category = Category.new(params[:category])
  	if @category.save
  		#success!
  		flash[:success] = "Tag added!"
  		redirect_to categories_path
  	else
  		#FAIL!
  		render 'new'
  	end
  end

  def index
  	@categories = Category.all(order: 'tag')
  end

  def destroy
  	Category.find(params[:id]).destroy
    flash[:success] = "Tag deleted."
    redirect_to categories_path
  end
end
