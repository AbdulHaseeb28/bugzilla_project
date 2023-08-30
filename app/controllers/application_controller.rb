# ApplicationController is the base class for all controllers in the application.
class ApplicationController < ActionController::Base
  before_action :authenticate_user!
end