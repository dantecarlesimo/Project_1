class ApplicationController < ActionController::Base

  include SessionsHelper
  include UsersHelper
  include ScenariosHelper

  protect_from_forgery with: :exception

end
