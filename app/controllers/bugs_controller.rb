# frozen_string_literal: true
# Controller for managing bugs.

class BugsController < ApplicationController
  def index
    @bug = Bug.all
  end 

  def new
    @bug = Bug.new
  end  

  def create
    @bug = current_user.bugs.build(bug_params)
    @bug.developer = nil
    
    if @bug.save
      redirect_to user_path(current_user), notice: 'Bug was successfully created.'
    else
      render :new
    end
  end

  def show
    @bug = Bug.find(params[:id])
  end
  
  private 

  def bug_params
    params.require(:bug).permit(:title, :description, :deadline, :screenshot, :type, :status)
  end
end
  