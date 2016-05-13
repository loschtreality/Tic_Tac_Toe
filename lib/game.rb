require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_reader :player_one, :player_two, :board
  attr_reader :current_player


  def initialize(p1, p2)
    @player_one = p1
    @player_two = p2
    @board = Board.new
    @current_player = @player_one
  end

  def play_turn
    puts "-------------------------"
    current_player.display(@board)
    move = current_player.get_move
    board.place_mark(move, current_player.mark)
    switch_players!
  end


  def switch_players!
    @current_player = if @current_player == @player_one
      @player_two
    else
      @player_one
    end
  end

  def play
    puts "Let the game begin!"
    play_turn until board.over?
    if @board.winner.nil?
      puts 'Tie game!'
    else
      puts "#{@board.winner} is the winner!"
    end
  end
end


if __FILE__ == $PROGRAM_NAME
  human = HumanPlayer.new()
  human.mark = :X
  computer = ComputerPlayer.new
  computer.mark = :O
  tic_tac = Game.new(human,computer)
  tic_tac.play
end
