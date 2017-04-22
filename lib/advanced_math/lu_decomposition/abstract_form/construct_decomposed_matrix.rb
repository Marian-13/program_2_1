module AdvancedMath
  module LUDecomposition
    module AbstractForm
      class ConstructDecomposedMatrix
        include AbstractCall

        attr_reader :matrix, :vector

        def initialize(attrs_hash)
          @matrix = attrs_hash[:matrix]
          @vector = attrs_hash[:vector]
        end

        private
          def determine_decomposed_matrix_row_size
            matrix.row_size
          end

          def determine_decomposed_matrix_column_size
            matrix.column_size + 1
          end

          def prepare_decomposed_matrix(row_size, column_size)
            decomposed_matrix = MutableMatrix.new(
              row_size: row_size,
              column_size: column_size,
            )

            decomposed_matrix.row_size.times do |i|
              decomposed_matrix[i] = prepare_decomposed_matrix_row(i)
            end

            decomposed_matrix
          end

          def prepare_decomposed_matrix_row(index)
            # Array#+ is Non-destructive
            # Array#concat is Destructive
            matrix[index] + [vector[index]]
          end

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
