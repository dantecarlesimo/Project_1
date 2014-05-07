class ScenariosController < ApplicationController

  include ScenariosHelper

  before_filter :signed_in_user, only: [:create, :new, :edit, :update, :destroy] #located in session helpers
  before_filter :check_scenario_owner, only: [:edit, :update, :destroy, :show]


  def new
    @scenario = Scenario.new
  end

  def create
    @scenario = current_user.scenarios.new scenario_params
    if @scenario.loan_amount == nil || @scenario.loan_amount == ""
      @scenario.loan_amount = @scenario.purchase_price.to_f*0.8
    end
    if @scenario.save
      redirect_to @scenario
    else
      flash[:error] = "Failed to create new scenario.  Please complete all fields."
      redirect_to new_scenario_path
    end
  end

  def show
    @scenario = Scenario.find(params[:id])
    api_caller
    #30 year fixed rate calculations
    rate=@thirty_year_fixed.to_f/100.00/12.00
    n=360
    @monthly_payment=(@scenario.loan_amount*(rate*(1+rate)**n)/((1+rate)**n-1)).round(2)
    @dti = (((@monthly_payment+@scenario.other_exp).to_f/@scenario.income.to_f)*100.00).round(2) 
    disposable_income_1 = @scenario.income-@scenario.housing_exp-@scenario.other_exp
    disposable_income_2 = @scenario.income-@monthly_payment-@scenario.other_exp
    @disp_income_diff = (disposable_income_2 - disposable_income_1).round(2)
    #15 year fixed rate calculations
    rate_2=@fifteen_year_fixed.to_f/100.00/12.00
    n_2=180
    @monthly_payment_2=(@scenario.loan_amount*(rate_2*(1+rate_2)**n_2)/((1+rate_2)**n_2-1)).round(2)
    @dti_2 = (((@monthly_payment_2+@scenario.other_exp).to_f/@scenario.income.to_f)*100.00).round(2) 
    disposable_income_3 = @scenario.income-@scenario.housing_exp-@scenario.other_exp
    disposable_income_4 = @scenario.income-@monthly_payment_2-@scenario.other_exp
    @disp_income_diff_2 = (disposable_income_4 - disposable_income_3).round(2)
    #5/1 ARM rate calculations
    rate_3=@five_one_adjust.to_f/100.00/12.00
    n_3=360
    @monthly_payment_3=(@scenario.loan_amount*(rate_3*(1+rate_3)**n_3)/((1+rate_3)**n_3-1)).round(2)
    @dti_3 = (((@monthly_payment_3+@scenario.other_exp).to_f/@scenario.income.to_f)*100.00).round(2) 
    disposable_income_5 = @scenario.income-@scenario.housing_exp-@scenario.other_exp
    disposable_income_6 = @scenario.income-@monthly_payment_3-@scenario.other_exp
    @disp_income_diff_3 = (disposable_income_6 - disposable_income_5).round(2)


    api_caller
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
    redirect_to(current_user)
  end

  private
    def scenario_params
      params.require(:scenario).permit(:income, :housing_exp, :other_exp, :credit_score, :purchase_price, :loan_amount, :rate, :program, :title, :user_id)  
    end



end
