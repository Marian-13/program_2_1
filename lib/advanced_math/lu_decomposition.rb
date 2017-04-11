module AdvancedMath
  class LUDecomposition
    attr_reader :matrix, :vector

    def initialize(attrs)
      @matrix = attrs[:matrix]
      @vector = attrs[:vector]
    end

    def decomposed_matrix
      decomposed_matrix_row_size    = determine_decomposed_matrix_row_size
      decomposed_matrix_column_size = determine_decomposed_matrix_column_size

      indices = 0...decomposed_matrix_column_size

      mutable_matrix = MutableMatrix.new(
        row_size: decomposed_matrix_row_size,
        column_size: decomposed_matrix_column_size
      )

      indices.each do |k|
        indices.each do |i|
          indices.each do |j|
            # mutable_matrix[][] =  
          end
        end
      end
    end

    private
      def determine_decomposed_matrix_row_size
        matrix.row_size
      end

      def determine_decomposed_matrix_column_size
        # TODO
        matrix.column_size
      end
  end
end
