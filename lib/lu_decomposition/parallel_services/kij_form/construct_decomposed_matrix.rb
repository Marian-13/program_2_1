module LUDecomposition
  module ParallelServices
    module KIJForm
      class ConstructDecomposedMatrix < AbstractForm::ConstructDecomposedMatrix
        def call
          # result_row_size    = determine_decomposed_matrix_row_size
          # result_column_size = determine_decomposed_matrix_column_size
          #
          # result = prepare_decomposed_matrix(result_row_size, result_column_size)
          #
          # (0...(result_row_size - 1)).each do |k|
          #   ((k + 1)...result_row_size).each do |i|
          #     ((k + 1)...result_column_size).each do |j|
          #       result[i][j] -= (result[i][k] / result[k][k]) * result[k][j]
          #     end
          #   end
          # end
          #
          # # TODO Generic matrix
          # RowMatrix.new(rows: result.elements)

          result_row_size    = determine_decomposed_matrix_row_size
          result_column_size = determine_decomposed_matrix_column_size

          decomposed_matrix = prepare_decomposed_matrix(
            result_row_size,
            result_column_size
          )

          cyclic_layer_scheme = CyclicLayerScheme.new(
            matrix: decomposed_matrix
          )

          cyclic_layer_scheme.start
        end
      end
    end
  end
end


# |1 2 3 4 1|    |4 1 2 3 4|    |  4   1   2   3   4|    |  4   1   2   3   4|
# |2 3 4 1 2| => |2 3 4 1 2| => |  0 -10 -12   2   0| => |  0 -10 -12   2   0| =>
# |3 4 1 2 3|    |3 4 1 2 3|    |  3   4   1   2   3|    |  0  13  -2  -1   0|
# |4 1 2 3 4|    |1 2 3 4 1|    |  1   2   3   4   1|    |  1   2   3   4   1|

#    |  4   1   2   3   4|
# => |  0 -10 -12   2   0|
#    |  0  13  -2  -1   0|
#    |  0   7  10  13   0|
