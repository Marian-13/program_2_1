module AdvancedMath
  class AbstractVector
    attr_reader :elements

    def initialize(*)
      raise NotImplementedError
    end

    def size
      @size ||= elements.size
    end

    def [](index)
      elements[index]
    end

    def to_a
      elements
    end

    def to_h
      { elements: elements }
    end
  end
end
