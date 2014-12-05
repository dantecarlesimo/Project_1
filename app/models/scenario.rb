class Scenario < ActiveRecord::Base
  
  belongs_to :user
  

  ## Nice job here.  You could potentially add some more validations
  ## like checking that the credit score is in the valid range.
  validates :title, presence: true
  validates :income, presence: true
  validates :housing_exp, presence: true
  validates :other_exp, presence: true
  validates :credit_score, presence: true
  validates :purchase_price, presence: true

end

