class AddUserIdToScenarios < ActiveRecord::Migration
  def change
    add_reference :scenarios, :user, index: true
  end
end
