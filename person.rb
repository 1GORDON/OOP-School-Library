# rubocop: disable Style/OptionalBooleanParameter

require_relative 'corrector'
require_relative 'rental'

class Person
  attr_accessor :name, :age, :rentals, :parent_permission
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
  end

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  private

  def ofage?
    return true unless age < 18
  end

  public

  def use_services?
    return true if ofage? || parent_permission
  end

  def validate_name
    @name = @corrector.correct_name(name)
  end
end

# rubocop: enable Style/OptionalBooleanParameter

person = Person.new(25, 'gordontinyefuza')
person.validate_name
