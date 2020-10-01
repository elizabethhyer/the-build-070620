class SessionsController < ApplicationController

    def new

    end 

    def create 
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to projects_path
        else
            render :new 
        end 
    end 

    def create_with_facebook
        user = User.find_or_create_by(username: auth["email"]) do |u|
            u.password = "password"
        end 
        user.save
        session[:user_id] = user.id
        redirect_to projects_path
    end 

    def destroy
        session.clear 
        redirect_to '/'
    end 

    private 

    def auth 
        request.env['omniauth.auth']
    end 

end 