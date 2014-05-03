# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :scenario do
    income 1
    housing_exp 1
    other_exp 1
    credit_score 1
    purchase_price 1
    loan_amount 1
    rate 1.5
    program "MyString"
  end
end
