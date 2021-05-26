class UsersController < ApplicationController

  def index 
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new
  end

  def update
    @uaer.update(user_params)
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :name_reading, :surname_reading, :nickname, :email, :pasword, :birthday)
  end
end
