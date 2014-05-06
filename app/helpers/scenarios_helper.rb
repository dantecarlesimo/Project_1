module ScenariosHelper
  def check_scenario_owner
    scenario = current_user.scenarios.where(:id => params[:id]).first
    if scenario.nil?
      flash[:error] = "That's not your scenario."
      redirect_to user_path(current_user)
    end
  end

  def api_caller
    zwsid = ENV['ZILLOW_KEY']
    
    request = Typhoeus.get("http://www.zillow.com/webservice/GetRateSummary.htm?zws-id=#{zwsid}&output=json") 
    result = JSON.parse(request.body)
    @thirty_year_fixed = result['response']['today']['thirtyYearFixed']
    @fifteen_year_fixed = result['response']['today']['fifteenYearFixed']
    @five_one_adjust = result['response']['today']['fiveOneARM']
  end
end
