class UsersController < ApplicationController
  def new
  end

  def show
  	authenticate_user!
  	@user = User.find(params[:id])
  end

end
