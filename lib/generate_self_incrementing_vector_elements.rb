class GenerateSelfIncrementingVectorElements
  attr_reader :first_element, :increment, :size

  def initialize(attrs_hash)
    @first_element = attrs_hash[:first_element]
    @increment     = initialize_increment(attrs_hash[:increment])
    @size          = attrs_hash[:size]
  end

  def call
    elements = Array.new(size)

    element = decrement_first_element

    (0...size).each do |i|
      element += increment
      elements[i] = element
    end

    elements
  end

  private
    def initialize_increment(increment)
      increment || 1
    end

    def decrement_first_element
      first_element - increment
    end
end
