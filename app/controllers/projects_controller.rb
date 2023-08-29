class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find_by(id: params[:id])

      if @project.nil?
        redirect_to projects_path, alert: 'Project not found.'
      end
  end

  def new
    if current_user.manager?
      @project = Project.new
    else
      redirect_to projects_path, alert: "You are not authorized to create a new project."
    end
  end
  
  def create
    @project = Project.new(project_params)
    @project.user = current_user # Assuming you're associating the project with the current user

    if @project.save
      redirect_to @projects, notice: 'Project was successfully created.'
    else
      render :new
    end
  end

  def edit
    @project = Project.find(params[:id])
    @users = User.all
  end  

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end
  
  private

  def project_params
    params.require(:project).permit(:name, user_ids: [])
  end
end