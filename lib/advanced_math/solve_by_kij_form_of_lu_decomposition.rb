module AdvancedMath
  class SolveByKIJFormOfLUDecomposition
    attr_reader :column_matrix, :row_vector

    def initialize(attrs)
      @column_matrix = attrs[:column_matrix]
      @row_vector    = attrs[:row_vector]
    end

    # TODO Extract methods
    def call
      decomposed_matrix_row_size    = determine_decomposed_matrix_row_size
      decomposed_matrix_column_size = determine_decomposed_matrix_column_size

      result = MutableMatrix.new(
        row_size: decomposed_matrix_row_size,
        column_size: decomposed_matrix_row_size,
        matrix: column_matrix
      )

      (0...(decomposed_matrix_row_size - 1)).each do |k|
        ((k + 1)...decomposed_matrix_row_size).each do |i|
          ((k + 1)...decomposed_matrix_column_size).each do |j|
            result[i][j] -= (result[i][k] / result[k][k]) * result[k][j]
          end
        end
      end

      RowMatrix.new(rows: result.elements)
    end

    private
      def determine_decomposed_matrix_row_size
        column_matrix.row_size
      end

      def determine_decomposed_matrix_column_size
        column_matrix.column_size
      end

      def build_decomposed_matrix(row_size, column_size)

      end
  end
end
