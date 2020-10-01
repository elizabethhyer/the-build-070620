class ApplicationController < ActionController::Base

    helper_method :current_user

    def require_login
        redirect_to 'login' if !current_user
    end 

    def current_user
        @user = User.find_by(id: session[:user_id])
    end 

end
