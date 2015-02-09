class JsonController < ApplicationController
  def show
    @snippet = Snippet.find_by :id => params[:id]
    if @snippet.nil?
      render nothing: true, status: 404
    else
      render json: @snippet
    end
  end
end
