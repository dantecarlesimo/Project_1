class Scenario < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :income, presence: true
  validates :housing_exp, presence: true
  validates :other_exp, presence: true
  validates :credit_score, presence: true
  validates :purchase_price, presence: true
  validates :loan_amount, presence: true




end

