module LUDecomposition
  module ParallelServices
    module KIJForm
      class ConstructDecomposedMatrix < AbstractForm::ConstructDecomposedMatrix
        def call
          result_row_size    = determine_decomposed_matrix_row_size
          result_column_size = determine_decomposed_matrix_column_size

          decomposed_matrix = prepare_decomposed_matrix(
            result_row_size,
            result_column_size
          )

          processors_row_indices = CyclicLayerScheme::GenerateProcessorsRowIndices.new(
            processors_amount: 3,
            matrix: decomposed_matrix
          ).call

          # Matrix.new(elements: decomposed_matrix.elements)
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
