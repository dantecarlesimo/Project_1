module UsersHelper
  def check_user
   # binding.pry
    # user = current_user
    if current_user.nil? || (current_user.id.to_s != params[:id])
      flash[:error] = "That's not your account."
      redirect_to current_user
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
