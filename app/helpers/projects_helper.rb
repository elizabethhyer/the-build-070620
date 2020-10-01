module ProjectsHelper

    def welcome_message
        if current_user
            "<h1>My Projects</h1>"
        else 
            "<h1>Looking For Your Next Project?</h1>"
        end 
    end 

end
