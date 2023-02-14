# class that uses Place and Player. Resebles the Game itself

class Game
  attr_reader :won

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = Array.new(9) { |index| Place.new(index) }
    @won = false
  end

  def board_display(board)
    return "#{board[0].owner} | #{board[1].owner} | #{board[2].owner}\n
          ---------------------------------------\n
          #{board[3].owner} | #{board[4].owner} | #{board[5].owner}\n
          ---------------------------------------\n
          #{board[6].owner} | #{board[7].owner} | #{board[8].owner}\n"
  end

  def check_winner(board, player)
    winning_positions = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
    if board.include? player.owned_places
      puts "The winner is #{player.name}!"
      @won = true
  end

  def assign_place(letter, place)
    if @board[place].taken
      puts @board[place].error_message
    else
      @board[place].owner = letter
      @board[place].taken = true
    end
  end
end
