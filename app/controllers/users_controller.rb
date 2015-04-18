class UsersController < ApplicationController
  def show
    id = params[:user_id]
    @user = User.find(id)
  end
end
