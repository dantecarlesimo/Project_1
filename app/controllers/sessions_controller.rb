class SessionsController < ApplicationController

  def new
    api_caller
  end

  def create
    user=User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) #checks password
      # Sign the user in and redirect to the user's show page.
      sign_in user
      if user.scenarios.length>1 || user.scenarios.length<1
      redirect_to user
      else
      # scenario = Scenario.find(params[:id])
      #scenario=Scenario.find_by(user)
      scenario=user.scenarios.first
      redirect_to(scenario)
      end
    else
      # Create an error message and re-render the signin form.
      flash[:error]='Invalid email address/password combination'
      redirect_to signin_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
