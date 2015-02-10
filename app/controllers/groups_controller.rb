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
  
  private
  
  def group_params
    params.require(:group).permit(:name)   
  end
end
