module AdvancedMath
  module LUDecomposition
    module KIJForm
      class ConstructDecomposedMatrixInParallel < AbstractForm::ConstructDecomposedMatrix
        attr_reader :processors_amount, :processors

        def initialize(attrs_hash)
          super(attrs_hash)

          @processors_amount = attrs_hash[:processors_amount]
          @processors        = attrs_hash[:processors]
        end

        def call
          result_row_size    = determine_decomposed_matrix_row_size
          result_column_size = determine_decomposed_matrix_column_size

          decomposed_matrix = prepare_decomposed_matrix(
            result_row_size,
            result_column_size
          )

          (0...(result_row_size - 1)).each do |k|
            main_element_row_index = find_main_element_row_index(decomposed_matrix, k)

            if main_element_row_index != k
              decomposed_matrix.swap_rows!(k, main_element_row_index)
            end

            (0...processors_amount).each do |processor_index|
              processors[processor_index].add_task do |row_indices|
                ((k + 1)...result_row_size).each do |i|

                  if row_indices.include? i
                    ((k + 1)...result_column_size).each do |j|
                      decomposed_matrix[i][j] -=
                        (decomposed_matrix[i][k] / decomposed_matrix[k][k]) *
                          decomposed_matrix[k][j]
                    end
                  end
                end
              end
            end

            processors.each(&:wait)
          end

          processors.each(&:join)

          Matrix.new(elements: decomposed_matrix.elements)
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
