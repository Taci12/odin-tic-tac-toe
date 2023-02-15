# frozen_string_literal: true

# place in the board.
class Place
  attr_accessor :taken, :owner

  def initialize(owner)
    @owner = owner
    @taken = false
  end

  def self.error_message
    "Oops! Can't take this spot"
  end
end

# to represent a player of the game.
class Player
  attr_reader :owned_places, :name, :letter

  def initialize(name, letter)
    @name = name
    @letter = letter
    @owned_places = []
  end

  def add_owned_place(index)
    @owned_places << index
    @owned_places.sort!
  end
end

# uses Place and Player. Resebles the Game itself
class Game
  attr_reader :won, :board

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
  end

    def assign_place(letter, place)
      if @board[place].taken
        puts @board[place].error_message
        false
      else
        @board[place].owner = letter
        @board[place].taken = true
        true
      end
    end
  end

def player_login(number)
  puts "Player #{number}, enter your name"
  name = gets
  puts 'Enter a letter to represent you in the board'
  letter = gets
  until letter.is_a?(String)
    puts 'Please enter a letter'
    letter = gets
  end
  Player.new(name, letter[0])
end

player1 = player_login(1)
player2 = player_login(2)
game = Game.new(player1, player2)

until game.won

  puts game.board_display(game.board)
  puts "#{player1.name}, please select a place to capture: "
  gets place
  until (place.is_a? Integer) && (place <= 8 && place >= 0)
    puts 'Please enter a valid place to capture'
    gets place
  end
  success = game.assign_place(player1.letter, place)
  until success 
    success = game.assign_place(player1.letter, place)
  end
  player1.add_owned_place(place)
  game.check_winner(game.board, player1)

  # for player 2
  puts game.board_display
  puts "#{player2.name}, please select a place to capture: "
  gets place
  until (place.is_a? Integer) && (place <= 8 && place >= 0)
    puts 'Please enter a valid place to capture'
    gets place
  end
  success = game.assign_place(player2.letter, place)
  until success 
    success = game.assign_place(player2.letter, place)
  end
  player2.add_owned_place(place)
  game.check_winner(game.board, player2)
end
