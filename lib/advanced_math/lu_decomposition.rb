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

      result = MutableMatrix.new(
        row_size: decomposed_matrix_row_size,
        column_size: decomposed_matrix_column_size,
        matrix: matrix
      )

      (0...matrix.row_size).each do |k|
        ((k + 1)...matrix.column_size).each do |i|
          ((k + 1)...matrix.column_size).each do |j|
            result[i][j] =
              result[i][j] - (result[i][k] / result[k][k]) * result[k][j]
          end
        end
      end

      RowMatrix.new(rows: result.elements)
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
