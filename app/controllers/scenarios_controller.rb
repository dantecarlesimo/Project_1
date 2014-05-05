class ScenariosController < ApplicationController

#     include RecipesHelper

   before_filter :signed_in_user, only: [:create, :new, :edit, :update, :destroy, :show] #located in session helpers
  # before_filter :check_recipe_owner, only: [:edit, :update, :destroy]

#   def index
#     @recipes = Recipe.all
#   end

  def new
    @scenario = Scenario.new
  end

  def create
    scenario = Scenario.create scenario_params
    #scenario.user_id = 5 #change to current user 
    #scenario.user_id=User.find(session[:user_id])
    #scenario.save
    redirect_to(scenario)
  end

  def show
    @scenario = Scenario.find(params[:id])
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
