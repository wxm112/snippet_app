class GroupsController < ApplicationController
  def index
    @groups = @current_user.groups
  end

  def create
    @group = Group.create group_params
    @group.users << @current_user
    @group.save
    redirect_to groups_path
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find_by :id => params[:id]
  end

  def show
    @group = Group.find_by :id => params[:id]
  end

  def update
    @group = Group.find_by :id => params[:id]
    @group.update group_params
    redirect_to(groups_path)
  end

  def destroy
    @group = Group.find_by :id => params[:id]
    @group.destroy
    redirect_to(groups_path)
  end

  def add 
    @snippet = Snippet.new
    @group = Group.find_by :id => params[:id]
  end

  def add_user_to_group
    @group = Group.find_by :id => params[:id]
    @users = User.all - [@current_user]
  end

  def choose_user_to_group
    @user = User.find params[:group][:users]
    @group = Group.find params[:id]
    respond_to do |format|
      ExampleMailer.add_to_group_email(@user,@current_user,@group).deliver_now
      format.html { render plain: "You have sent the Invitation to #{@user.name} succeessfully."}
      format.json { render :show, status: :created, location: @user }
    end

  end 

  def save_user_to_group
    @user = User.find params[:user_id]
    @group = Group.find params[:id]
    unless @group.users.include? @user
      @group.users << @user
      end
    render plain: "You have been added to #{@group.name} succeessfully."
  end
  
  private
  
  def group_params
    params.require(:group).permit(:name)   
  end
end
