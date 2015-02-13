class UsersController < ApplicationController
  def new
    @user = User.new
    @confirmation_code = [*('A'..'Z')].sample(8).join
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
        group = Group.create(name: @user.name, is_personal: true)
        group.users << @user
        ExampleMailer.activate_email(@user).deliver_now
        format.html { render plain: "Thank you for signing up #{@user.name}, please go to your email to activate your account."}
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def activate
    @user = User.find params[:id]
    if @user.confirmation_code == params[:confirmation_code]
      @user.confirmed = true
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user.id)
    end
  end

  def index
    @users = User.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation, :email, :confirmation_code, :confirmed)
  end
end
