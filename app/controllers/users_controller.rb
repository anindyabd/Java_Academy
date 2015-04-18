class UsersController < ApplicationController
  def show
    id = params[:id]
    @user = User.find(id)
  end
end
