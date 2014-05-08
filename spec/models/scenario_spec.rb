require 'spec_helper'

describe Scenario do
  it 'should not be missing a title' do
    scenario = FactoryGirl.build(:scenario, title: nil)
    scenario.should_not be_valid
  end
end
