class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  include SessionsHelper
  include UsersHelper

  protect_from_forgery with: :exception

    zwsid = ENV['ZILLOW_KEY']
    
    request = Typhoeus.get("http://www.zillow.com/webservice/GetRateSummary.htm?zws-id=#{zwsid}&output=json") 
    result = JSON.parse(request.body)
    @thirty_year_fixed = result['response']['today']['thirtyYearFixed']
    @fifteen_year_fixed = result['response']['today']['fifteenYearFixed']
    @five_one_adjust = result['response']['today']['fiveOneARM']

end
