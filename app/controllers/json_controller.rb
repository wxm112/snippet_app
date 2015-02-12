class JsonController < ApplicationController

  before_filter :set_access_control_headers

  def set_access_control_headers
    binding.pry
    headers['Access-Control-Allow-Origin'] = '*'
  end

  def show
    @snippet = Snippet.find_by :id => params[:id]
    if @snippet.nil?
      render nothing: true, status: 404
    else
      render json: @snippet
    end
  end
end
