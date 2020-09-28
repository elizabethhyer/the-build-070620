class ProjectsController < ApplicationController

    def index
        @projects = Project.all
    end 

    def show
        @project = Project.find_by(id: params[:id])
    end 

    def new 
        @project = Project.new
    end 

    def create
        @project = Project.create(project_params)
        redirect_to project_path(@project)
    end 

    def edit
    end 

    def update 
    end 

    def delete 
    end 

    private 

    def projects_params
        params.require(:project).permit(:name, :technique_used, :material_used)
    end

end
