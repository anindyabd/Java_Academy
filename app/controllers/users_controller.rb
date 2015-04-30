class UsersController < ApplicationController
  before_action :authenticate_user! 

  def show
    id = params[:id]
    @user = User.find(id)
  end
end
