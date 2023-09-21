module BracketTree
    module Bracket
      class SingleElimination < Base
        template BracketTree::Template::SingleElimination
        include PositionalRelationDelegators
        attribute :winner, :boolean
      end
    end
  end