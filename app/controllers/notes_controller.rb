class NotesController < ApplicationController
    before_action :set_project, only: [:show, :new, :edit, :update]
    before_action :set_note, only: [:show, :edit, :update, :destroy]

    def show 
    end 

    def new 
        @note = @project.notes.build 
    end 

    def create
        @note.user = current_user
        if @note.save
            redirect_to project_path(@project)
        else
            @errors = @note.errors.full_messages
            render :new 
        end 
    end 

    def edit 
    end 

    def update
        if @note.update(note_params)
            redirect_to project_path(@project)
        else
            @errors = @note.errors.full_messages
            render :edit 
        end 
    end 

    def destroy
        @note.destroy
        redirect_to projects_path
    end 

    private 

    def note_params
        params.require(:note).permit(:title, :content, :project_id)
    end 

    def set_project
        @project = Project.find_by(id: params[:project_id])
    end 

    def set_note 
        @note = Note.find_by(id: params[:id])
    end 

end
