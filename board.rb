class Board
  X_SIZE = 7
  Y_SIZE = 6

  attr_reader :state

  def initialize
    @state = initial_state
  end

  def place_ball(col, value)
    cell = state.select{|cell| cell.first == col && cell.last.nil? }.first

    raise StandardError unless cell

    cell[2] = value
    cell.first(2)
  end

  private

  def initial_state
    result = []
    (0..X_SIZE - 1).each do |x|
      (0..Y_SIZE - 1).each do |y|
        result << [x, y, nil]
      end
    end
    result
  end
end
