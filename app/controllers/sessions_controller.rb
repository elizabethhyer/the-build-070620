class SessionsController < ApplicationController
    before_action :redirect_if_logged_in, except: [:destroy]
    layout :determine_layout

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
        user = User.find_or_create_by(email: auth["info"]["email"]) do |u|
            u.username = auth["info"]["name"]
            u.first_name = auth["info"]["name"].split(" ")[0]
            u.last_name = auth["info"]["name"].split(" ").last
            # byebug
            u.password = "password"
        end 
        if user.save
        session[:user_id] = user.id
        redirect_to projects_path
        else 
            @user = User.new
            render 'users/new'
        end 
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