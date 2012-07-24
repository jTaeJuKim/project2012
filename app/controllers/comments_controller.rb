class CommentsController < ApplicationController

	def new
	end

	def create
	    @post = Post.find(params[:post_id])
	    @poster = "#{current_user.name} #{current_user.surname} (#{current_user.email})"
	    @comment = @comment = @post.comments.build(params[:comment])
	    
	    if @comment.save
	      redirect_to post_path(@post)
	    else
	      flash[:fail] = "Comment not added"
	      redirect_to post_path(@post)
	    end
    end


	def destroy
	    @comment = Comment.find(params[:id])
	    @comment.destroy

	    redirect_to(@comment.post)
    end
end
