require_relative 'manufacturer'

class Railcar
  include Manufacturer

  attr_reader :number

  def initialize
    @number = rand(999)
    validate!
  end

  def type
  end

  def to_s
    "#{type.capitalize} railcar number #{number}"
  end

  def valid?
    validate!
  rescue
    false
  end

  protected

  def validate!
    raise "Railcar has to have type" if type.nil?
    true
  end
end
