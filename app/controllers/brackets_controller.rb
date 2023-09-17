class BracketsController < ApplicationController
  #include Visible
  
def new
    @bracket = Bracket.new
  end
  
# def create
#   bracket_params = params.require(:bracket).permit(players: [:name]) # Permit the players parameter with an array of names
  
#   @bracket = Bracket.new(bracket_params)

#   if @bracket.save
#     # Generate a Double Elimination bracket template for the number of players
#     num_players = 12 # Change this to the appropriate number
#     template = BracketTree::Template::DoubleElimination.by_size(num_players)

#     # Seed the bracket with player data
#     players = [
#       { player: @bracket.player },
#       # Add more players as needed
#     ]

#     bracket = BracketTree::Bracket::DoubleElimination.new(template)
#     bracket.seed(players)

#     # Now you can work with the bracket, record match results, etc.
#     # ...

#     render json: { message: 'Bracket created successfully' }
#   else
#     render :new # Render the form again with errors if the save fails
def create
  bracket_params = params.require(:bracket).permit(players: [:name]) # Permit the players parameter with an array of names

  # Create a new bracket
@bracket = Bracket.new

# Generate a Double Elimination bracket template for 12 players
num_players = 12
template = BracketTree::Template::DoubleElimination.by_size(num_players)

# Seed the bracket with player data
players_data = bracket_params[:players].values
players = []

players_data.each do |player|
  players << Player.new(name: player[:name])
end

@bracket.players = players

# Now you can work with the bracket, record match results, etc.
# ...

if @bracket.save
  redirect_to bracket_path(@bracket)
else
  # Handle validation or other errors
  render :new
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
end