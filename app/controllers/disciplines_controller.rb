class DisciplinesController < ApplicationController

    def index
        @disciplines = Dinscipline.all 
    end 

    def show 
        @discipline = Discipline.find_by(id: params[:id])
    end 

end
