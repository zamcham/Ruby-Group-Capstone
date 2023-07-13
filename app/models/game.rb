require_relative 'item'
require 'date'

class Game < Item
  attr_accessor :game_name, :multiplayer, :last_played_at
  attr_reader :genre, :author, :publish_date, :label

  def initialize(game_data)
    super(
      game_data[:genre],
      game_data[:author],
      game_data[:publish_date],
      game_data[:label]
    )
    @game_name = game_data[:game_name]
    @multiplayer = game_data[:multiplayer]
    @last_played_at = game_data[:last_played_at]
  end

  def can_be_archived?
    super || last_played_at.nil? || (Date.today - Date.parse(last_played_at)).to_i > 730
  end
end
