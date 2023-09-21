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
    @bracket = BracketTree::Bracket::SingleElimination.new(
      matches: template.matches,
      seed_order: template.seed_order
    )
   

    # Create players and associate them with seats
    @bracket.seats.each_with_index do |seat, index|
      if players_data[index].present?
        player = Player.create(name: players_data[index][:name])
        seat.player = player
        players << player
      end
    end
    # puts "Inspecting @bracket contents:"
    # puts @bracket.inspect


      # Serialize the bracket data to JSON
    bracket_data = @bracket.to_h # Assuming to_h method is implemented in Bracket class

    # Respond with JSON
    puts "Inspecting bracket_data contents:"
    puts bracket_data.inspect
    render json: { bracket_data: bracket_data }
    # Serialize the bracket data to JSON
    #bracket_data = @bracket.to_json
   
    #render json: { bracket_data: bracket_data }
   
    end
  end
  

  def show
    @bracket = Bracket.find(params[:id])
    @players = @bracket.seats.map(&:player)
  
    respond_to do |format|
      format.html # Render the HTML template (default behavior)
      format.json { render json: bracket_with_players_json }
      serializer = BracketSerializer.new(@bracket)
      render json: serializer.to_json
    end
   # @bracket = Bracket.find(params[:id])
    
  end
  
  private
  
  def bracket_with_players_json
    {
      matches: @bracket.matches.as_json(include: { seats: {} }),
      seats: @bracket.seats.as_json,
      starting_seats: @bracket.starting_seats,
      players: @players.as_json
    }

    def get_bracket_with_players
      @bracket = # Call your bracket_with_players_json method here
  
      respond_to do |format|
        format.json { render json: @bracket }
      end
  end
  
end
