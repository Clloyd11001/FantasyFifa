class AddRoundsToBrackets < ActiveRecord::Migration[7.0]
  def change
    add_column :brackets, :rounds, :integer
  end
end
