class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    unless @user.email == current_user.email
      redirect_to :back, :alert => "Access denied."
    end
  end
end
