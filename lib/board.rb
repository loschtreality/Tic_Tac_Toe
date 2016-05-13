# In your Board class, you should have a grid instance variable to keep track of the board tiles. You should also have the following methods:

# place_mark, which takes a position such as [0, 0] and a mark such as :X as arguments. It should throw an error if the position isn't empty.

# empty?, which takes a position as an argument

# winner, which should return a mark

# over?, which should return true or false

# If you want to be a little fancy, read the attached bracket-methods reading.

class Board
  attr_reader :grid

  def initialize(grid = [Array.new(3), Array.new(3), Array.new(3)])
    @grid = grid
  end

  def place_mark(position, mark)
    if position.first.is_a?(Array)
      position.each do |el|
        @grid[el[0]][el[1]] = mark
      end
    else
      @grid[position[0]][position[1]] = mark
    end
  end

  def empty?(position)
    @grid[position[0]][position[1]].nil? ? true : false
  end

  def winner
    horizontal_w = false
    vertical_w = false
    leftDiag_w = false
    rightDiag_w = false
    @grid.each do |row|
      horizontal_w = :X if row.all? { |el| el == :X }
      horizontal_w = :O if row.all? { |el| el == :O }
    end
    leftDiag_w = :X if (0..2).all? { |el| @grid[el][el] == :X }
    leftDiag_w = :O if (0..2).all? { |el| @grid[el][el] == :O }

    rightDiag_w = :X if (0..2).all? { |el| @grid[2 - el][el] == :X }
    rightDiag_w = :O if (0..2).all? { |el| @grid[2 - el][el] == :O }

    @grid.transpose.each do |row|
      vertical_w = :X if row.all? { |el| el == :X }
      vertical_w = :O if row.all? { |el| el == :O }
    end

    if !(horizontal_w || vertical_w || leftDiag_w || rightDiag_w)
      nil
    else
      horizontal_w || vertical_w || leftDiag_w || rightDiag_w
    end
  end

  def over?
    if winner
      return true
    else
      game_over = true
      @grid.each do |row|
        game_over = false if row.any?(&:nil?)
      end
    end
    game_over
  end



end
