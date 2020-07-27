class ChangeInputTypeInFlightsTable < ActiveRecord::Migration
  def change
    change_column :flights, :user_id, :integer
  end
end
