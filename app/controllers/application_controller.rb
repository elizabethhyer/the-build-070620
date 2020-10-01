class ApplicationController < ActionController::Base

    helper_method :current_user

    def require_login
        redirect_to '/login' if !current_user
    end 

    def redirect_if_logged_in
        redirect_to projects_path if current_user
    end 

    def current_user
        @user = User.find_by(id: session[:user_id])
    end 

    def determine_layout
        current_user ? "logged_in" : "application"
      end

end
