class UsersController < ApplicationController
    before_action :redirect_if_logged_in, except: [:show]
    before_action :require_login, except: [:new, :create]
    before_action :check_profile_owner, only: [:edit, :update, :destroy]
    before_action :set_user, except: [:new, :create]
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
    end 

    def edit
    end 

    def update 
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            render :edit 
        end 
    end 

    def destroy
        @user.destroy
        redirect_to '/'
    end 

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :password_confirmation)
    end 


    def set_user
        @user = User.find_by(id: params[:id])
    end 

    def check_profile_owner
        if @user.none? { |u| u.user == current_user }
            redirect_to projects_path
        end 
    end 

end
