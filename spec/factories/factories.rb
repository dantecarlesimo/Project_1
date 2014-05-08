FactoryGirl.define do

  sequence :email do |n|
    "sally#{n}@user.com"  #makes each email unique in the factory below
  end

    factory :user do
    first_name "Sally"
    last_name "User"
    email #gets filled with unique email from above
    password "password"
    password_confirmation "password"
  end


  factory :scenario do
    income 7000
    housing_exp 1000
    other_exp 200
    credit_score 750
    purchase_price 500000
    loan_amount 40000
  end



end

