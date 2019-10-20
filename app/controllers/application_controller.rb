class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    #return user from db if matches session user_id
    # ||= to prevent multiple hits to the db and is called 
    # return @current_user if it already exists, if not then hit the database
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end 

  #convert current_user to a boolean by typing !! will return true if there is a current user and false if not
  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action!"
      redirect_to root_path
    end
  end
end
