class SessionsController < ApplicationController

    def new

    end 

    def create 
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to projects_path
        else 
            @errors = @user.errors.full_messages
            render :new 
        end 
    end 

    def logout
    end 

end 