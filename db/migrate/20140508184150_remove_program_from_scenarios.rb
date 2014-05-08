class RemoveProgramFromScenarios < ActiveRecord::Migration
  def change
    remove_column :scenarios, :program, :string
  end
end
