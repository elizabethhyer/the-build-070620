class NotesController < ApplicationController

    def index 
        @notes = Note.all
    end 

    def new
        @note = Note.new
    end 

    def create
        @note = Note.new(note_params)
        if @note.save
            redirect_to somewhere
        else
            @errors = @project.errors.full_messages
            render :new 
        end 
    end 

    def edit 
        @note = Note.find_by(id: params[:id])
    end 

    def update
        @note = Note.find_by(id: params[:id])
        if @note.update(note_params)
            redirect_to somewhere
        else
            @errors = @project.errors.full_messages
            render :edit 
        end 
    end 

    private 

    def note_params
        params.require(:note).permit(:title, :content)
    end 

end
