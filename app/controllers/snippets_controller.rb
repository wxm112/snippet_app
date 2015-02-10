class SnippetsController < ApplicationController
  def new
    @snippet = Snippet.new
  end

  def edit
    @snippet = Snippet.find params[:id]
  end

  def show
    @snippet = Snippet.find params[:id]
  end

  def update
    #raise params.inspect
    snippet = Snippet.find params[:id]
    snippet.update(snippet_params)
    redirect_to(snippets_path)
  end

  def destroy
    snippet = Snippet.find params[:id]
    snippet.destroy
    redirect_to(snippets_path)
  end

  def index
    personal_snippets = Group.find_by :name => @current_user.name 
    @snippets = personal_snippets.snippets
  end

  def create
    @snippet = Snippet.new snippet_params
    @group = Group.find_by :name => @current_user.name
    @snippet.groups << @group
    @snippet.save
    redirect_to snippets_path
  end

  def save
    @snippet = Snippet.create snippet_params
    group = Group.find params[:id]
    @snippet.groups << group
    redirect_to group_path
  end

  def share
    @snippet = Snippet.find params[:id]
  end

  def add_to_group
    @snippet = Snippet.find params[:id]
    @group = Group.find params[:snippet][:groups]
    unless @group.snippets.include? @snippet
      @group.snippets << @snippet
    end
  end

  private
  
  def snippet_params
    params.require(:snippet).permit(:name,:content)   
  end
end
