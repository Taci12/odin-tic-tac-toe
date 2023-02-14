include '../lib/player.rb'
include '../lib/place.rb'
include '../lib/game.rb'

def player_login(number)
  puts "Player #{number}, enter your name"
  name = gets
  puts "Enter a letter to represent you in the board"
  letter = gets
  while (letter.length > 1 && letter.length == 0) && (!letter.instance_of(String))
    puts "Please enter a letter"
    letter = gets
  end
  return Player.new(name, letter)
end

player1 = player_login(1)
player2 = player_login(2)
game = Game.new(player1, player2)

while !game.won
  puts game.board_display
  puts "#{player1.name}, please select a place to capture: "
  gets place
  # ckeck if the selected place is valid, and continue with the game logic.
end