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
    "#{type.capitalize} railcar number #{number}, #{number_of_free_seats} free seats, #{number_of_occupied_seats} occupied seats"
  end

  def occupy_seat
    self.seats_occupied += 1 if number_of_free_seats.positive?
  end

  def number_of_occupied_seats
    seats_occupied
  end

  def number_of_free_seats
    seats_total - seats_occupied
  end

  protected

  attr_writer :seats_occupied

  def validate!
    raise "Seats number cannot be negative" if seats_total.negative?
    super
  end
end
