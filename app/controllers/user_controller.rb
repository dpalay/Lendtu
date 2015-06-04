class UserController < ApplicationController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:password_hash]
    @user.save!
    #redirect_to @user
    render text: params.inspect
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
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
