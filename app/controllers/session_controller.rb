class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by :name => params[:username]
    if 
      user.present? && user.authenticate(params[:password]) 
      if user.confirmed 
        session[:user_id] = user.id
        redirect_to(user_path(user.id))
      else
        flash[:error] = "Your account hasn't been actived. Please active your account by email "
        redirect_to(login_path)
      end
    else
      flash[:error] = "Invalid login or password"
      redirect_to(login_path)
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to(root_path)
  end
end
