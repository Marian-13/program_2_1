module AdvancedMath
  class LUDecomposition
    attr_reader :matrix, :vector

    def initialize(attrs)
      @matrix = attrs[:matrix]
      @vector = attrs[:vector]
    end

    def decomposed_matrix
      indices = 0...decomposed_matrix_size

      mutable_matrix =
      indices.each do |k|
        indices.each do |i|
          indices.each do |j|
          end
        end
      end
    end

    private
      def decomposed_matrix_size
        matrix.size
      end
  end
end
