class ScenariosController < ApplicationController

     include ScenariosHelper

   before_filter :signed_in_user, only: [:create, :new, :edit, :update, :destroy] #located in session helpers
   before_filter :check_scenario_owner, only: [:edit, :update, :destroy, :show]

#   def index
#     @recipes = Recipe.all
#   end

  def new
    @scenario = Scenario.new
  end

  def create
    #scenario = Scenario.create scenario_params
    scenario = current_user.scenarios.create scenario_params
    #scenario.user_id = 5 #change to current user 
    #scenario.user_id=User.find(session[:user_id])
    #scenario.save
    redirect_to(scenario)
  end

  def show
    @scenario = Scenario.find(params[:id])
    rate=@scenario.rate/100.00/12.00
    n=360
    #P = L[c(1 + c)n]/[(1 + c)n - 1]
    @monthly_payment=(@scenario.loan_amount*(rate*(1+rate)**n)/((1+rate)**n-1)).round(2)
    #@monthly_payment=@scenario.loan_amount*(rate/(1-(1+rate)**(-n)))
    #binding.pry
    @dti = (((@monthly_payment+@scenario.other_exp).to_f/@scenario.income.to_f)*100.00).round(2) 
    disposable_income_1 = @scenario.income-@scenario.housing_exp-@scenario.other_exp
    disposable_income_2 = @scenario.income-@monthly_payment-@scenario.other_exp
    @disp_income_diff = (disposable_income_2 - disposable_income_1).round(2)
  end

  def edit
    @scenario = Scenario.find(params[:id])
  end

  def update
    scenario = Scenario.find(params[:id])
    scenario.update_attributes scenario_params
    redirect_to(scenario)
  end

  def destroy
    scenario = Scenario.find(params[:id])
    scenario.delete
    redirect_to(scenarios_path)
  end

  private
    def scenario_params
    params.require(:scenario).permit(:income, :housing_exp, :other_exp, :credit_score, :purchase_price, :loan_amount, :rate, :program, :title, :user_id)  
  end



end
