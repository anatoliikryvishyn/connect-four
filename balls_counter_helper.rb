class BallsCounterHelper
  def initialize(balls)
    @balls = balls
    @ball_x, @ball_y = balls.last
  end

  def calculate(x_plus_operation, y_plus_operation)
    result = 0
    (1..Game::BALLS_TO_WIN - 1).each do |i|
      ball = balls.find{|b| b == [ball_x + incremented_value(i, x_plus_operation), ball_y + incremented_value(i, y_plus_operation)]}
      ball ? result += 1 : break
    end
    result
  end

  private

  attr_reader :balls, :ball_x, :ball_y

  def incremented_value(value, plus_operation)
    return 0 if plus_operation.nil?
    return value if plus_operation

    -value
  end
end
