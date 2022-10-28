require_relative 'balls_counter_helper'

class BallsChecker
  def initialize(balls)
    @balls = balls
    @counter_helper = BallsCounterHelper.new(balls)
  end

  def perform
    return false if balls.count < Game::BALLS_TO_WIN

    check_horizontal || check_vertical || check_right_diagonal || check_left_diagonal
  end

  private

  attr_reader :balls, :counter_helper

  def count_condition(left_count, right_count)
    left_count + right_count == Game::BALLS_TO_WIN - 1
  end

  def check_horizontal
    left_count = counter_helper.calculate(false, nil)
    right_count = counter_helper.calculate(true, nil)
    count_condition(left_count, right_count)
  end

  def check_vertical
    left_count = counter_helper.calculate(nil, true)
    right_count = counter_helper.calculate(nil, false)
    count_condition(left_count, right_count)
  end

  def check_right_diagonal
    left_count = counter_helper.calculate(true, true)
    right_count = counter_helper.calculate(false, false)
    count_condition(left_count, right_count)
  end

  def check_left_diagonal
    left_count = counter_helper.calculate(false, true)
    right_count = counter_helper.calculate(true, false)
    count_condition(left_count, right_count)
  end
end
