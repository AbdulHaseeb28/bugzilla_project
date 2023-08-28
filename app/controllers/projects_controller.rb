class ProjectsController < ApplicationController
  def index
      @projects = Project.all
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