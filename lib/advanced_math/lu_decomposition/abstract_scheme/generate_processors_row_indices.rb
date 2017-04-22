module AdvancedMath
  module LUDecomposition
    module AbstractScheme
      class GenerateProcessorsRowIndices
        include AbstractCall

        attr_reader :processors_amount, :matrix

        def initialize(attrs_hash)
          @processors_amount = attrs_hash[:processors_amount]
          @matrix            = attrs_hash[:matrix]
        end
      end
    end
  end
end
