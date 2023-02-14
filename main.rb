class Player
  attr_accessor :name, :letter

  def initialize(name, letter)
    @name = name
    @letter = letter
  end
end

class Place
  attr_accessor :taken, :owner 

  def self.error_message
    return "Oops! Can't take this spot"
  end
end

