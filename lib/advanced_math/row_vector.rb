module AdvancedMath
  # TODO Row and Column vectors abstraction
  class RowVector
    attr_reader :elements

    def initialize(attrs)
      @elements = attrs[:elements]
    end

    def size
      @size ||= elements.size
    end

    def [](index)
      elements[index]
    end

    def to_h
      { elements: elements }
    end
  end
end
