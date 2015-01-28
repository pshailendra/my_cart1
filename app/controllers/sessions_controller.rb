class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to products_path, :notice => 'Logged In... '
    else
      redirect_to new_session_path, :notice => 'Incorrect Email/Password...!'
    end
  end

  def new
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, :notice => 'Logged Out...!'
  end
end
