class UsersController < ApplicationController
  require 'typhoeus'
  require 'json'

  before_filter :signed_in_user, only: [:edit, :update, :destroy, :show] #located in session helpers
  before_filter :check_user, only: [:edit, :update, :destroy, :show]


  def show
    @user = User.find(params[:id])
    @scenarios= @user.scenarios
    # zwsid = ENV['ZILLOW_KEY']
    api_caller
    # request = Typhoeus.get("http://www.zillow.com/webservice/GetRateSummary.htm?zws-id=#{zwsid}&output=json") 
    # result = JSON.parse(request.body)
    # @thirty_year_fixed = result['response']['today']['thirtyYearFixed']
    # @fifteen_year_fixed = result['response']['today']['fifteenYearFixed']
    # @five_one_adjust = result['response']['today']['fiveOneARM']

  end



  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) #use new instead of create
    if @user.save
      flash[:success] = "Welcome to the Mortgage app!"
      sign_in @user #adds a token to users browser to save info
      redirect_to @user
    else
      flash[:error] = "Failed to create account.  Try again."
      redirect_to new_user_path
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    redirect_to @user
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
