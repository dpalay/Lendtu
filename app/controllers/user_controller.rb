class UserController < ApplicationController

  def index
    @users = User.all
  end

  def edit

  end

  def create
    @user = User.new(user_params)
    @user.save
    @user.identities.create(uid: @user.id, provider: 'LendTu')
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
  end

  def destroy

  end

  def new

  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :first_name, :last_name)
  end


end
