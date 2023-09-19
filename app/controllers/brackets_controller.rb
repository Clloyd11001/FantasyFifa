class BracketsController < ApplicationController
  def new
    @bracket = Bracket.new
  end

  def create
    bracket_params = params.require(:bracket).permit(players: [:name])
    @bracket = Bracket.new
  
    # Generate a Double Elimination bracket template for 12 players
    num_players = 8
    template = BracketTree::Template::SingleElimination.by_size(num_players)
  
    # Seed the bracket with player data
    players_data = bracket_params[:players].values
    players = []
  
    players_data.each do |player_data|
      name = player_data[:name]
      players << Player.new(name: name)
    end
  
    @bracket.players = players
  
    player_count = players.size
  
    @bracket.rounds = Math.log2(player_count).ceil
    @bracket.matches = player_count - 1
  
    if @bracket.save
      redirect_to bracket_path(@bracket)
    else
      puts @bracket.errors.full_messages
      render :new
    end
  end
  

  def show
    @bracket = Bracket.find(params[:id])
  end

  
end
