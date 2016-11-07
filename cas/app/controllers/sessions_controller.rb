class SessionsController < ApplicationController
  def new
    @users = User.all
  end
  
  def create
    @users = User.all
    user = User.find_by(email: params[:session][:email].downcase)
    if user 
      if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "Successfully logged in"
        if !user.is_admin
          redirect_to faculty_path(:id => user.id)
        else
          redirect_to admins_path
        end
      else
        flash.now[:notice] = "Error logging in."
        render :new
      end
    else
      flash.now[:notice] = "Error logging in."
      render :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "you have logged out"
    redirect_to root_path
  end
end