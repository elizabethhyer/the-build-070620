class ProjectsController < ApplicationController
    before_action :set_project, except: [:new, :create, :index]
    before_action :require_login, except: [:index, :show]

    def index
        if params[:user_id]
            @projects = User.find_by(id: params[:user_id]).projects.distinct
        else 
            @projects = Project.all
        end 
    end 

    def show
        @user = @project.notes.user
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
            @errors = @project.errors.full_messages
            render :new 
        end 
    end 

    def edit
    end 

    def update 
        if @project.update(project_params)
            redirect_to project_path(@project)
        else
            @errors = @project.errors.full_messages
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

end
