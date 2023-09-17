class AddPlayerAndTeamToBrackets < ActiveRecord::Migration[7.0]
  def change
    add_column :brackets, :player, :string
    add_column :brackets, :team, :string
  end
end
