module ScenariosHelper
    def check_scenario_owner
    scenario = current_user.scenarios.where(:id => params[:id]).first
    if scenario.nil?
      flash[:error] = "That's not your scenario."
      redirect_to user_path(current_user)
    end
  end
end
