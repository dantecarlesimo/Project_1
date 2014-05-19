class SessionsController < ApplicationController

  def new
    ## Like I mentioned in the helper, a more descriptive name would be
    ## good here.
    api_caller
  end

  def create
    user=User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password]) #checks password
      # Sign the user in and redirect to the user's show page.
      sign_in user

      ## This logic could also be user.scenarios.lenght != 1
      if user.scenarios.length>1 || user.scenarios.length<1
        ## Watch out for spacing here.  2 spaces of indentation
      redirect_to user
      else
        ## Spacing!

        ## Cool logic here.  I like how you're making the experience
        ## better based on the number of scenarios
      # scenario = Scenario.find(params[:id])
      #scenario=Scenario.find_by(user)
      scenario=user.scenarios.first
      redirect_to(scenario)
      end
    else
      # Create an error message and re-render the signin form.
      flash[:error]='Invalid email address/password combination'
      ## Good job here.  Always redirect on a post request.
      redirect_to signin_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

end
