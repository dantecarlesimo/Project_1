module ScenariosHelper
    def check_scenario_owner
    scenario = current_user.scenarios.where(:id => params[:id]).first
    if scenario.nil?
      flash[:error] = "That's not your recipe."
      redirect_to scenario_path(params[:id])
    end
  end
end
