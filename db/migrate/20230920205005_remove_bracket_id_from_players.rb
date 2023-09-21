class RemoveBracketIdFromPlayers < ActiveRecord::Migration[7.0]
  def change
        remove_reference :players, :bracket, foreign_key: true
      end
  end    

