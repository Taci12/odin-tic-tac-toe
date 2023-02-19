# represents a player of the game
class Player
  attr_reader :name, :number
  attr_accessor :owned_places, :won

  def initialize(name, number)
    @name = name
    @number = number
    @owned_places = []
    @won = false
  end

  def victory_message
    "Congrats #{self.name}, you're the winner!"
  end


end

# class that represents the game
class Game
  attr_reader :tie

  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @occupied_places = []
    @winning_combinations = [
      [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6],
      [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]
    ]
    @board = Array.new(9) { |i| i }
    @tie = false
  end

  def capture_place(player, place)
    @occupied_places.include? place
    @occupied_places << place
    @occupied_places.sort!
    player.number == 1 ? @board[place] = 'X' : @board[place] = 'O'
    player.owned_places << place
    player.owned_places.sort!
  end

  def display_board
    puts ''
    puts "#{@board[0]}|#{@board[1]}|#{@board[2]}\n
--+--+--\n#{@board[3]}|#{@board[4]}|#{@board[5]}\n--+--+--\n
#{@board[6]}|#{@board[7]}|#{@board[8]}\n\n"
  end

  def check_winner(player)
    joined = player.owned_places.join
    if @winning_combinations.any? { |sub_array| joined.include? sub_array.join }
      player.won = true
    end
  end

  def check_tie
    all_owned_places = @player1.owned_places + @player2.owned_places
    all_owned_places.sort!
    if all_owned_places == Array.new(9) { |i| i }
      @tie = true
    end
  end
end

puts "Hello and welcome to Tic-Tac-Toe!\nPlayer 1, please enter your name:"
name = gets.chomp
player1 = Player.new(name, 1)
puts "Now it's player 2's turn:"
name = gets.chomp
player2 = Player.new(name, 2)
game = Game.new(player1, player2)
puts "Now let's begin!"

while !(player1.won || player2.won || game.tie)
  game.display_board
  puts "#{player1.name} select a place to capture:"
  place = gets.to_i
  while !(place <= 8 && place >= 0) && (game.occupied_places.include? place)
    puts "Please enter a valid place:"
    place = gets
  end
  game.capture_place(player1, place)
  game.check_winner(player1)
  game.check_tie
  
  if !(player1.won && game.tie)
    # player 2
    game.display_board
    puts "#{player2.name} select a place to capture:"
    place = gets.to_i
    while !(place <= 8 && place >= 0) && (game.occupied_places.include? place)
      puts "Please enter a valid place:"
      place = gets
    end
    game.capture_place(player2, place)
    game.check_winner(player2)
    game.check_tie
  end
end

if (player1.won)
  puts player1.victory_message
elsif (player2.won)
  puts player2.victory_message
end