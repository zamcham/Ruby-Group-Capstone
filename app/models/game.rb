require_relative 'item'
require 'date'

class Game < Item
  attr_reader :multiplayer, :last_played_at, :publish_date, :game_name

  def initialize(game_name, multiplayer, publish_date, last_played_at)
    super(game_name, multiplayer, publish_date, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)
    @game_name = game_name
  end

  def can_be_archived?
    super && (Date.today - @last_played_at).to_i > (730)
  end
end
