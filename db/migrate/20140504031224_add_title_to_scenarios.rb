class AddTitleToScenarios < ActiveRecord::Migration
  def change
    add_column :scenarios, :title, :string
  end
end
