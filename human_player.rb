class HumanPlayer
  attr_reader :name
  attr_accessor :mark

  def initialize(name = "Human")
    @name = name
  end

  def get_move
    print "Move where: "
    u_input = gets.chomp
    u_input.split(",").map(&:to_i)
  end

  def display(board)
    board.grid.each do |row|
      row.each { | el| print "[ #{el} ]" || "[   ]"}
      puts
    end
  end
end
