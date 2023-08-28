class BugsController < ApplicationController

    def new
        @bug = Bug.new
    end
   
    def create
        @bug = current_user.bugs.build(bug_params)
        if @bug.save
          redirect_to user_path(current_user), notice: 'Bug was successfully created.'
        else
          render :new
        end
    end

    def create
        @bug = current_user.bugs.build(bug_params) # Associate current user as the bug's creator
        
    end

    def create
        @bug = current_user.bugs.build(bug_params)
        @bug.developer = nil # Set the developer as nil initially
        if @bug.save
          redirect_to user_path(current_user), notice: 'Bug was successfully created.'
        else
          render :new
        end
    end

    def show
        @bug = Bug.find(params[:id])
        @bug_developer = @bug.developer
        @bug_project = @bug.project
    end
    
    def create
        @bug = current_user.bugs.build(bug_params)
        @bug.developer = nil # Set the developer as nil initially
        if @bug.save
          redirect_to user_path(current_user), notice: 'Bug was successfully created.'
        else
          render :new
        end
    end
    
    private
    
        def bug_params
            params.require(:bug).permit(:title, :description, :deadline, :screenshot, :type, :status, :project_id)
        end

end
