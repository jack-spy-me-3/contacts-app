class SessionsController < ApplicationController
  def new
    render "new.html.erb"
  end

  def create
    user = User.find_by_email(params[:email])
    if user.save && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in! Woohoo!"
      redirect_to "/contacts"
    else
      flash[:warning] = "Invalid email or password"
      redirect_to "/login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/login"
  end
end
