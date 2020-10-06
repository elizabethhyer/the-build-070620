module ProjectsHelper

    def welcome_message(route)
        if route
            content_tag(:h1, "My Projects")
        else 
            content_tag(:h1, "Looking For Your Next Project?")
        end 
    end 

    def user_projects_search(user)
        if user
            user_projects_path(user)
        else 
            projects_path
        end 
    end 

end
