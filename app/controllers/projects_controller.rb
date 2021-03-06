class ProjectsController < ApplicationController
    before_action :set_project, except: [:new, :create, :index]
    before_action :require_login, except: [:index, :show]
    before_action :check_project_user, only: [:edit, :update, :destroy]
    layout :determine_layout

    def index
        if params[:user_id] && params[:query]
            @projects = User.find_by(id: params[:user_id]).projects.distinct.search_by_keyword(params[:query])
            @user = User.find_by(id: params[:user_id])
        elsif params[:user_id]
            @projects = User.find_by(id: params[:user_id]).projects.distinct
            @user = User.find_by(id: params[:user_id])
        elsif params[:query]
            @projects = Project.search_by_keyword(params[:query])
        else 
            @projects = Project.all
        end 
    end 

    def show
        @creator = @project.notes.first.user
    end 

    def new 
        @project = Project.new
        @project.notes.build 
    end 

    def create
        @project = Project.new(project_params)
        if @project.save
            redirect_to project_path(@project)
        else
            render :new 
        end 
    end 

    def edit
    end 

    def update 
        if @project.update(project_params)
            redirect_to project_path(@project)
        else
            render :edit 
        end 
    end 

    def destroy
        @project.destroy
        redirect_to projects_path
    end 

    private 

    def project_params
        params.require(:project).permit(:name, :technique_used, :material_used, :discipline_id, notes_attributes: [:title, :content, :id, :user_id])
    end

    def set_project
        @project = Project.find_by(id: params[:id])
    end 

    def check_project_user 
        if @project.notes.none? { |n| n.user == current_user }
            redirect_to projects_path
        end 
    end 

end
