class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
    @user = User.find params[:id]
  end

  def show
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update(user_params)
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      group = Group.create(name: params[:user][:name]) 
      group.users << @user
      redirect_to(user_path(@user.id))
    else
      render :new
    end
  end


  def index
    @users = User.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end
