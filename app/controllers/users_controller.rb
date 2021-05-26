class UsersController < ApplicationController

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
    params.require(:user).permit(:first_name, :last_name, :name_reading, :surname_reading, :nickname, :email, :encrypted_pasword, :birthday)
  end
end
