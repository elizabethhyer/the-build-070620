class DisciplinesController < ApplicationController
    layout :determine_layout

    def new 
        @discipline = Discipline.new
    end 

    def create
        @discipline = Discipline.create(discipline_params)
        redirect_to disciplines_path
    end 

    def index
        @disciplines = Discipline.all 
    end 

    def show 
        @discipline = Discipline.find_by(id: params[:id])
    end 

    private

    def discipline_params
        params.require(:discipline).permit(:kind)
    end 

end
