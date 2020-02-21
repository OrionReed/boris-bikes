require_relative 'bike'

class DockingStation
  def initialize(capacity = 20)
    @bikes = []
    @capacity = capacity
  end

  attr_reader :capacity
  def dock(bike)
    raise 'Dock is full' if @bikes.count >= capacity || !bike.is_a?(Bike)
    @bikes << bike
  end

  def release_bike
    raise 'No bikes to release' unless @bikes.any?
    Bike.new
  end
end
