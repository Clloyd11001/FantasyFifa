# app/models/player.rb
class Player < ApplicationRecord
    # Define player attributes (columns in the players table)
    # For example, if you want to store the player's name and team:
    # attr_accessor :name, :team
    # These attributes should match the columns in your players table.
  
    # Define associations (if applicable)
    # Example: A player belongs to a bracket (assuming brackets can have one player each)
    # belongs_to :bracket
  
    # Define validations (if needed)
    # Example: Validate that a player must have a name
    validates :name, presence: true

   # validates :team_name, presence: true
  
    # Other player-related logic, methods, or callbacks can be added here
  end
  