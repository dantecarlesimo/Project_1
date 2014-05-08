class RemoveRateFromScenarios < ActiveRecord::Migration
  def change
    remove_column :scenarios, :rate, :float
  end
end
