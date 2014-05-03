class CreateScenarios < ActiveRecord::Migration
  def change
    create_table :scenarios do |t|
      t.integer :income
      t.integer :housing_exp
      t.integer :other_exp
      t.integer :credit_score
      t.integer :purchase_price
      t.integer :loan_amount
      t.float :rate
      t.string :program

      t.timestamps
    end
  end
end
