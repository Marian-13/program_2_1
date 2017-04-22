module AdvancedMath
  module LUDecomposition
    module AbstractForm
      class PerformBackSubstitution
        include AbstractCall

        attr_reader :decomposed_matrix

        def initialize(attrs_hash)
          @decomposed_matrix = attrs_hash[:decomposed_matrix]
        end

        private
          def determine_matrix_u_size
            decomposed_matrix.row_size
          end

          def extract_matrix_u(size)
            mutable_matrix_u = MutableMatrix.new(row_size: size, column_size: size)

            (0...size).each do |i|
              (0...size).each do |j|
                mutable_matrix_u[i][j] = decomposed_matrix[i][j]
            end
          end

            Matrix.new(elements: mutable_matrix_u.elements)
          end

          def extract_vector_y(size)
            mutable_vector_y = MutableVector.new(size: size)

            (0...size).each do |i|
              mutable_vector_y[i] = decomposed_matrix[i][size]
            end

            Vector.new(elements: mutable_vector_y.elements)
          end
      end
    end
  end
end
