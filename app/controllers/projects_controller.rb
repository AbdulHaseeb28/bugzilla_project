class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:edit, :update, :destroy]

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
    @project = Project.new(project_params) if current_user.manager?

    if @project.save
      redirect_to projects_path, notice: ('flash.project.created')
    else
      render :new
    end
  end

  def edit

  end  
  def add_developer
    @project = Project.find(params[:id])
    render 'add_developer'
  end
  
  def add_qa
    @project = Project.find(params[:id])
    render 'add_qa'
  end

  def delete_developers
    project = Project.find(params[:id])
    developer_ids = params[:developer_ids]
    if developer_ids.present?
      developers = User.where(id: developer_ids)
      project.users.delete(developers)
      flash[:notice] = 'Selected developers have been removed from the project.'
    else
      flash[:alert] = 'No developers were selected.'
    end
    redirect_to project_path(project)
  end

  
  def update
    if @project.update(project_params)
      redirect_to projects_path, notice: ('flash.project.updated')
    else
      render :edit
    end
  end
  
  def destroy
    @project.destroy
    redirect_to projects_path, notice: ('flash.project.deleted')
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
