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
