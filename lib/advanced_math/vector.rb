module AdvancedMath
  class Vector < AbstractVector
    def initialize(attrs_hash)
      @elements = attrs_hash[:elements]
    end
  end
end
