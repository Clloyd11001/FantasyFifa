# app/models/bracket.rb

class Bracket < ApplicationRecord
    #include Visible
  
    has_many :players, dependent: :destroy
  
    validates :name, presence: true
    validates :position, presence: true, length: { minimum: 10 }
  end
  