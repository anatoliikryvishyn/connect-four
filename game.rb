require_relative 'board'
require_relative 'player'

class Game
  BALL_COLORS = ['red', 'yellow'].freeze
  BALLS_TO_WIN = 4

  attr_reader :board, :players

  def initialize
    @board = Board.new
    @players = initialize_players
  end

  def move(col, player_color)
    raise StandardError unless BALL_COLORS.include?(player_color)
    return game_over_output if players.any?{ |p| p.winner }

    ball = board.place_ball(col, player_color)

    player = players.find{|p| p.color == player_color}
    res = player.add_ball(ball)

    turn_output(player)
    true
  end

  private

  def initialize_players
    BALL_COLORS.map{|color| Player.new(color)}
  end

  def turn_output(player)
    message = player.winner ? "#{player.color} player wins!" : "Next player turn"
    puts message
  end

  def game_over_output
    puts 'game is over'
  end
end
