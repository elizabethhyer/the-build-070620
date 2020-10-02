module ProjectsHelper

    def welcome_message(route)
        if route
            content_tag(:h1, "My Projects")
        else 
            content_tag(:h1, "Looking For Your Next Project?")
        end 
    end 

end
