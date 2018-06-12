class PassengerRailcar < Railcar
  attr_reader :seats_total, :seats_occupied

  def initialize(seats_total = 0)
    @seats_total    = seats_total
    @seats_occupied = 0
    super()
  end

  def type
    :passenger
  end

  def to_s
    "#{type.capitalize} railcar number #{number}, #{seats_free} free seats, #{seats_occupied} occupied seats"
  end

  def occupy_seat
    self.seats_occupied += 1 if seats_free.positive?
  end

  def seats_free
    seats_total - seats_occupied
  end

  protected

  attr_writer :seats_occupied

  def validate!
    raise "Seats number cannot be negative" if seats_total.negative?
    super
  end
end
