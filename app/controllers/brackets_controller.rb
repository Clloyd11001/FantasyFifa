class BracketsController < ApplicationController
  include Visible
 
  def create_bracket
      # Generate a Double Elimination bracket template for 8 players
      template = BracketTree::Template::DoubleElimination.by_size(8)
  
      # Create a blank bracket based on the template
      bracket = BracketTree::Bracket::DoubleElimination.new(template)
  
      # Seed the bracket with player data
      players = [
        { player: 'Player1' },
        { player: 'Player2' },
        # Add more players as needed
      ]
  
      bracket.seed(players)
  
      # Now you can work with the bracket, record match results, etc.
      # ...
  
      render json: { message: 'Bracket created successfully' }
    end
  
    def show_bracket
      # Load the bracket data based on the ID, assuming you have a Bracket model
      
      @bracket = Bracket.find(params[:id])
    end


    def render_bracket(bracket)
    output = ''
    bracket.rounds.each do |round|
      round.matches.each do |match|
        output += '<div class="match">'
        output += "<span>#{match.participant1.name}</span>"
        output += '<span>vs</span>'
        output += "<span>#{match.participant2.name}</span>"
        output += '</div>'
      end
    end
    output.html_safe
  end
  
  end
  