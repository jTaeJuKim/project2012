class AssignmentsController < ApplicationController
  def new
  	@assignment = Assignment.new
  end

  def destroy
  end

  def index
    @assignments = Assignment.all
  end

  def create
  	@assignment = Assignment.new(params[:assignment])
  	if @assignment.save
  		#success!
  		flash[:success] = "User assigned to role"
  		redirect_to users_path
  	else
  		#FAIL!
  		render 'new'
  	end
  end



end
