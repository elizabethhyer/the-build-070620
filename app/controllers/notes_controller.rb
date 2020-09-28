class NotesController < ApplicationController

    def show 
        @note = Note.find_by(id: params[:id])
    end 

    def new
    end 

    def create
    end 

    def edit 
    end 

    def update
    end 

    private 

    def note_params
        params.require(:note).permit(:title, :content)
    end 

end
