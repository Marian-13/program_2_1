module AdvancedMath
  class RowVector < AbstractVector
    def initialize(attrs_hash)
      @elements = attrs_hash[:elements]
    end
  end
end
