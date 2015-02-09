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
    @snippets = @current_user.snippets
  end

  def create
    @snippet = Snippet.new snippet_params
    @snippet.save
    redirect_to snippets_path
  end

  private
  
  def snippet_params
    params.require(:snippet).permit(:name,:content, :user_id)   
  end
end
