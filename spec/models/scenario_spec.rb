require 'spec_helper'

describe Scenario do

  it 'should not be missing a title' do
    scenario = FactoryGirl.build(:scenario, title: nil)
    scenario.should_not be_valid
  end

  it 'should generate 80% loan amount if loan amount field is blank' do
    scenario = FactoryGirl.build(:scenario, loan_amount: nil)
    scenario.should be_valid
  end

end
