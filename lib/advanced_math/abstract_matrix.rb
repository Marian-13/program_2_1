module AdvancedMath
  class AbstractMatrix
    def initialize(*)
      raise NotImplementedError
    end

    def row_size
      raise NotImplementedError
    end

    def column_size
      raise NotImplementedError
    end

    def [](index)
       raise NotImplementedError
    end

    def to_a
      raise NotImplementedError
    end

    def to_h
      raise NotImplementedError
    end
  end
end
