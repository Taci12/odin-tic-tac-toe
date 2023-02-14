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
