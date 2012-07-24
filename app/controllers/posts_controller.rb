class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @poster = "#{current_user.name} #{current_user.surname} (#{current_user.email})"
    @comment = @post.comments.build
  end

  def new
  	@post = current_user.posts.build if signed_in?
  end

  def create
  	@post = current_user.posts.build(params[:post])
    if @post.save
      flash[:success] = "Post saved!"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
 
    if @post.update_attributes(params[:post])
      flash[:success] = "Changes saved!"
      redirect_to post_path(@post)
    else
      flash[:fail] = "Error"
      render 'edit'
    end
  end

  def destroy
  	Post.find(params[:id]).destroy
    flash[:success] = "Post deleted."
    redirect_to posts_path
  end

  def index
  	@posts = Post.all
  end

end
