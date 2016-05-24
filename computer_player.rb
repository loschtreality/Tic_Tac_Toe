class ComputerPlayer
  attr_reader :name, :board
  attr_accessor :mark

  def initialize(name = "Computer")
    @name = name
  end

  def display(board)
    @board = board
  end


  def get_move
    move_arr = []
    
    # Horizontal
    @board.grid.each_with_index do |row, i|
      if row.count(@mark) == 2 && row.any?(&:nil?)
        move_arr = [i, row.index(nil)]
      end
    end

    # Diagonal Right
    @board.grid.each_with_index do |row,i|
      if row.count(@mark) == 2 && row[i].nil?
        move_arr = [i,i]
      end
    end

    # [[x][][]]
    # [[][x][]]
    # [[][][x]]

    # Diagonal left
    @board.grid.each_with_index do |row,i|
      if row.count(@mark) == 2 && row[2-i].nil?
        move_arr = [i,2-i]
      end
    end

    # [[][][o]]
    # [[][o][]]
    # [[o][][]]

    # Vertical
    @board.grid.transpose.each_with_index do |row, i|
      if row.count(@mark) == 2 && row.any?(&:nil?)
        move_arr = [row.index(nil), i]
      end
    end

    #Random move
    if move_arr.empty?
      row = rand(3)
      col = rand(3)
      move_arr = [row, col]
      until @board.empty?(move_arr)
        row = rand(3)
        col = rand(3)
        move_arr = [row, col]
      end
    end
    move_arr
  end
end
