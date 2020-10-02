module ProjectsHelper

    def welcome_message
        if '/users/id/projects'
            "<h1>My Projects</h1>"
        else 
            'projects'
            "<h1>Looking For Your Next Project?</h1>"
        end 
    end 

end
