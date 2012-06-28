class RolesController < ApplicationController
  def new
  end

  def index
  	@roles = Role.all
  end
end
