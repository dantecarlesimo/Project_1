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
    #Todays rates
    @thirty_year_fixed = result['response']['today']['thirtyYearFixed'].to_f.round(2)
    @fifteen_year_fixed = result['response']['today']['fifteenYearFixed'].to_f.round(2)
    @five_one_adjust = result['response']['today']['fiveOneARM'].to_f.round(2)
    #Last week's rates
    @thirty_year_fixed_last_week = result['response']['lastWeek']['thirtyYearFixed'].to_f.round(2)
    @fifteen_year_fixed_last_week = result['response']['lastWeek']['fifteenYearFixed'].to_f.round(2)
    @five_one_adjust_last_week = result['response']['today']['fiveOneARM'].to_f.round(2)
  end

end
