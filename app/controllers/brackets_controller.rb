class BracketsController < ApplicationController
  #include Visible
  
def new
    @bracket = Bracket.new
  end
  
def create
    bracket_params = params.require(:bracket).permit(:player, :team)
    @bracket = Bracket.new(bracket_params)

  if @bracket.save
    # Generate a Double Elimination bracket template for the number of players
    num_players = 12 # Change this to the appropriate number
    template = BracketTree::Template::DoubleElimination.by_size(num_players)

    # Seed the bracket with player data
    players = [
      { player: @bracket.player },
      # Add more players as needed
    ]

    bracket = BracketTree::Bracket::DoubleElimination.new(template)
    bracket.seed(players)

    # Now you can work with the bracket, record match results, etc.
    # ...

    render json: { message: 'Bracket created successfully' }
  else
    render :new # Render the form again with errors if the save fails

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
end
end