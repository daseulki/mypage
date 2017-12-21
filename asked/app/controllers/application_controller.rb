class ApplicationController < ActionController::Base

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  def current_user

    if session[:user_id].nil?
      @user = nil
    else
      @user = User.find(session[:user_id])
    end
  end

    def authorize
      if current_user.nil?
        flash[:alert] = "로그인 해야 글쓸 수 있어"
        redirect_to '/user/login'

      end
    end

  helper_method :current_user
end
