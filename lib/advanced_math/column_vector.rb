module AdvancedMath
  class ColumnVector < AbstractVector
    def initialize(attrs_hash)
      @elements = attrs_hash[:elements]
    end
  end
end
