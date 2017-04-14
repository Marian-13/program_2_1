module LUDecomposition
  module SequentialServices
    module KIJForm
      class ConstructDecomposedMatrix < AbstractForm::ConstructDecomposedMatrix
        # TODO Extract methods
        def call
          result_row_size    = determine_decomposed_matrix_row_size
          result_column_size = determine_decomposed_matrix_column_size

          result = prepare_decomposed_matrix(result_row_size, result_column_size)

          # TODO Temporary variable
          (0...(result_row_size - 1)).each do |k|
            main_element_row_index = find_main_element_row_index(result, k)

            if main_element_row_index != k
              result.swap_rows!(k, main_element_row_index)
            end

            ((k + 1)...result_row_size).each do |i|
              ((k + 1)...result_column_size).each do |j|
                result[i][j] -= (result[i][k] / result[k][k]) * result[k][j]
              end
            end
          end

          Matrix.new(elements: result.elements)
        end

        private
          def find_main_element_row_index(decomposed_matrix, index)
            FindMainElementRowIndex.new(
              matrix: decomposed_matrix,
              index: index
            ).call
          end
      end
    end
  end
end
