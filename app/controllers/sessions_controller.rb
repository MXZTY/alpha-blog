class SessionsController < ApplicationController
  def new 
    
  end

  #creates a new session with the user email and password if they are found in the db
  #method for validating login
  def create 
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #browsers cookies will handle storing user_id
      session[:user_id] = user.id
      flash[:success] = "You have successfully logged in"
      redirect_to user_path(user)
    else 
      flash.now[:danger] = "There was something wrong with your login information"
      render 'new'
    end
  end

  #method for logging out
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have been logged out"
    redirect_to root_path
  end
end