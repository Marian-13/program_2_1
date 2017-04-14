module AdvancedMath
  class Matrix < AbstractMatrix
    attr_reader :elements

    def initialize(attrs_hash)
      @elements = attrs_hash[:elements]
    end

    def row_size
      @row_size ||= elements.size
    end

    def column_size
      @column_size ||= elements[0].size
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
