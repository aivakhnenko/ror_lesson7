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
    "#{type.capitalize} railcar number #{number}, #{volume_of_free_capacity} free capacity, #{volume_of_used_capacity} used capacity"
  end

  def use_capacity(capacity_to_use)
    self.capacity_used += capacity_to_use if capacity_to_use <= volume_of_free_capacity
  end

  def volume_of_used_capacity
    capacity_used
  end

  def volume_of_free_capacity
    capacity_total - capacity_used
  end

  protected

  attr_writer :capacity_used

  def validate!
    raise "Capacity cannot be negative" if capacity_total.negative?
    super
  end
end
