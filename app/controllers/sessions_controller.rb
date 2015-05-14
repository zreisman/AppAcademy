class SessionsController < ApplicationController
  before_action :already_logged_in, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])

    if @user
      log_in!(@user)  #Add to App Control
      redirect_to cats_url
    else
      flash.now[:errors] = ["Invalid username or password"]
      @user ||= User.new(user_name: params[:user][:user_name])

      render :new
    end
  end

  def destroy
    @user = current_user
    session[:session_token] = nil
    @user.reset_session_token!
    redirect_to new_session_url
  end

end
