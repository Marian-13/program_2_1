module LUDecomposition
  module AbstractForm
    class SolveSLE
      include AbstractCall

      attr_reader :matrix, :vector

      def initialize(attrs_hash)
        @matrix = attrs_hash[:matrix]
        @vector = attrs_hash[:vector]
      end
    end
  end
end
