class UsersController < ApplicationController
    before_action :redirect_if_logged_in, except: [:show]
    before_action :require_login, only: [:show]
    layout :determine_layout

    def new
        @user = User.new
    end 

    def create 
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to projects_path
        else 
            render :new
        end 
    end 

    def show
        @user = User.find_by(id: params[:id])
    end 

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end 

end
