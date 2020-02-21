require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20
  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  attr_reader :capacity
  def dock(bike)
    raise 'Dock is full' if full?
    @bikes << bike
  end

  def release_bike
    raise 'No bikes to release' if empty?
    raise 'No working bikes' if @bikes.last.broken?
    @bikes.pop
  end

  private

  def full?
    @bikes.count >= capacity
  end

  def empty?
    @bikes.empty?
  end
end
