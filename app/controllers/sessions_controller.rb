class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, except: [:destroy]

    def new
    end 

    def create 
        @user = User.find_by(username: params[:user][:username])
        if @user && @user.authenticate(params[:user][:password])
            session[:user_id] = @user.id 
            redirect_to projects_path
        else
            @errors = ["Username or password incorrect"]
            render :new 
        end 
    end 

    def create_with_facebook
        user = User.find_or_create_by(username: auth["email"]) do |u|
            u.first_name = auth["name"].split(" ")[0]
            u.last_name = auth["name"].split(" ")[1]
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