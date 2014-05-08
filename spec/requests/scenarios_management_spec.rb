require 'spec_helper'

describe 'Scenarios Management' do 

  before :each do     
    @scenario=FactoryGirl.create(:scenario)
    @scenario_attributes = FactoryGirl.attributes_for(:scenario, title: "A different string")
    #use above to enter new key,value pairs to show changes to validate edit is working

    ApplicationController.any_instance.stub(:current_user).and_return(@scenario.user);
    #creates a fake instance of a user so that we can run our route tests becuase 
    #a user must be signed in for routes to work @recipe.user is the fake user created with
    #with instance of @recipe in the FactoryGirl
  end


  describe 'editing a scenario' do
    it 'should update in database'do
      get "/scenarios/#{@scenario.id}/edit"

      expect(response).to render_template(:edit)

      expect(response.body).to include("Any String",7000)

      put "/scenario/#{@scenario.id}", scenario: @scenario_attributes

      @scenario.reload
      @scenario.title.should eq("A different string")

    end

  end

  describe 'showing a scenario' do
    it 'should show specific scenario'do
      get "/scenarios/#{@scenario.id}/"

      expect(response).to render_template(:show)

      expect(response.body).to include("Any String",7000, 200)

      @scenario.title.should eq("Any String")

    end

  end
  
end