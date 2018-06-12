class CargoRailcar < Railcar
  attr_reader :capacity_total, :capacity_used

  def initialize(capacity_total = 0)
    @capacity_total = capacity_total
    @capacity_used  = 0
    super()
  end

  def type
    :cargo
  end

  def to_s
    "#{type.capitalize} railcar number #{number}, #{capacity_free} free capacity, #{capacity_used} used capacity"
  end

  def use_capacity(capacity_to_use)
    self.capacity_used += capacity_to_use if capacity_to_use <= capacity_free
  end

  def capacity_free
    capacity_total - capacity_used
  end

  protected

  attr_writer :capacity_used

  def validate!
    raise "Capacity cannot be negative" if capacity_total.negative?
    super
  end
end
