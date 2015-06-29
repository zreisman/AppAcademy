class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  def authorized_owner
    cat = Cat.find(params[:id])
    unless current_user.id == cat.user_id
      flash[:errors] = ["That's not your cat!"]
      redirect_to cat_url(cat)
    end

    true
  end

  def current_user
    User.find_by(session_token: session[:session_token])
  end

  def log_in!(user)
    session[:session_token] = user.reset_session_token!
  end

  def log_out!(user)

  end

  def already_logged_in
    redirect_to cats_url if current_user
  end

end
