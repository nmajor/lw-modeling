require_relative 'room'

class Patient
  # DATA
  # name
  # cured
  attr_reader :name, :cured
  attr_accessor :room, :id # Room object

  def initialize(attributes = {})
    @name = attributes[:name]
    @cured = attributes[:cured] || false
    @id = attributes[:id]
  end

  # BEHAVIOR
  # cure

  def cured?
    @cured
  end

  def cure!
    @cured = true
  end
end