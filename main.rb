
#represents a player of the game
class Player
  attr_reader :owned_places, :name, :number
  attr_writer :owned_places

  def initialize(name, number)
    @name = name
    @number = number
    @owned_places = []
  end

  def victory_message
    "Congrats #{self.name}, you're the winner!"
  end


end

class Game 
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @occupied_places = []
    @winning_combinations = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]
    ]
    @board = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def capture_place(player, place)
    if @occupied_places.include? place
      @occupied_places << place
      @occupied_places.sort!
      player.number == 1 ? @board[place] = 'X' : @board[place] = 'O'
      player.owned_places << place
      player.owned_places.sort!
      true
    else
      false
    end

    
  end
end
