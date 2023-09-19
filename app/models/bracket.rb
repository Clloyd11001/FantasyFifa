# app/models/bracket.rb

class Bracket < ApplicationRecord
    #include Visible
  
    has_many :players, dependent: :destroy
  
    validates :players, presence: true
    end
  