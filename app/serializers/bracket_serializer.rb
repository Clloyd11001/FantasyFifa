# app/serializers/bracket_serializer.rb
class BracketSerializer
    def initialize(bracket)
      @bracket = bracket
    end
  
    def to_json
      {
        # Define the JSON structure here based on your requirements
        matches: serialize_matches,
        seats: serialize_seats,
        starting_seats: @bracket.starting_seats,
        bracket_data: @bracket.to_h,
      }.to_json
    end
  
    private
  
    def serialize_matches
        matches_data = []
    
        @bracket.matches.each do |match|
          serialized_match = {
            seats: match.seats.map(&:position),
            winner_to: match.winner_to,
            loser_to: match.loser_to
            # Add other match attributes as needed
          }
    
          matches_data << serialized_match
        end
    
        matches_data
      end
    
      def serialize_seats
        seats_data = []
    
        @bracket.seats.each do |seat|
          serialized_seat = {
            position: seat.position,
            player: seat.player.as_json(only: [:id, :name])
            # Add other seat attributes as needed
          }
    
          seats_data << serialized_seat
        end
    
        seats_data
  end
  