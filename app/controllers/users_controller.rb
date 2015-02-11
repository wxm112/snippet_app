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
    respond_to do |format|
      if @user.save
        ExampleMailer.active_email(@user).deliver_now
        format.html { redirect_to user_path(@user.id), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
        session[:user_id] = @user.id
        group = Group.create(name: params[:user][:name], is_personal: true)
        group.users << @user
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end


  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end
end
