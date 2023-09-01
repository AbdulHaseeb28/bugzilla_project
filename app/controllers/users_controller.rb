# frozen_string_literal: true
# This controller handles user-related actions.
class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @projects = @user.projects
  end
end
