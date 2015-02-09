class JsonController < ApplicationController
  def show
    if Snippet.find_by :name => params[:name]
      @snippet = Snippet.find_by :name => params[:name]
    end
    render json: @snippet
  end
end
