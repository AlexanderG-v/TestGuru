class SessionsController < ApplicationController

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:original_path] || root_path
    else
      flash.now[:alert] = 'Verify Email and Password please'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end
end
