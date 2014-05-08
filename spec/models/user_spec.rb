require 'spec_helper'

describe User do

  #before each allows you to create a "user" to use for each test if all were the same

  describe 'email' do

      it 'should not be empty' do     
        # user = User.create(name: 'jackie',
        # password: 'password', password_confirmation: 'password')
      user = FactoryGirl.build(:user, email: nil)
        user.should_not be_valid
      end 

      it 'should be formatted correctly' do
        # user = User.create(name: 'jackie', email: 'jackie.com', password:'password', password_confirmation:'password')
        user = FactoryGirl.build(:user, email: "sally.com")
        user.should_not be_valid
      end

      it 'should be unique' do 
        # user1 = User.create(name: 'jackie', email: 'jackie@gmail.com', password:'password', password_confirmation:'password')
        user1=FactoryGirl.create(:user) ##.create actually saves to the database so that the test will fail when user 2 is checked against user 1
        # user2 = User.create(name: 'jackie2', email: 'jackie@gmail.com', password:'password2', password_confirmation:'password2')
        user2=FactoryGirl.build(:user, email: user1.email)# .build just builds an instance but doesnt save which is what you normall use.
        user2.should_not be_valid
      end
    end

end
