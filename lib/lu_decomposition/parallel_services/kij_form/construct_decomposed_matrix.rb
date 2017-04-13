module LUDecomposition
  module ParallelServices
    module KIJForm
      class ConstructDecomposedMatrix < AbstractForm::ConstructDecomposedMatrix
        def call
          result_row_size    = determine_decomposed_matrix_row_size
          result_column_size = determine_decomposed_matrix_column_size

          result = prepare_decomposed_matrix(result_row_size, result_column_size)

          
        end
      end
    end
  end
end
