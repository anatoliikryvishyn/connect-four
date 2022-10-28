require_relative 'balls_checker'

class Player
  attr_reader :color, :balls, :winner

  def initialize(color)
    @color = color
    @balls = []
    @winner = false
  end

  def add_ball(ball)
    balls << ball
    @winner ||= perform_check
  end

  private

  def perform_check
    BallsChecker.new(balls).perform
  end
end
