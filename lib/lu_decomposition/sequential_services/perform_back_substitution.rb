module LUDecomposition
  module SequentialServices
    class PerformBackSubstitution
      attr_reader :decomposed_matrix

      def initialize(attrs_hash)
        @decomposed_matrix = attrs_hash[:decomposed_matrix]
      end

      def call
        size = determine_matrix_u_size

        matrix_u = extract_matrix_u(size)
        vector_y = extract_vector_y(size)

        mutable_vector_y = MutableVector.new(vector: vector_y)

        result = MutableVector.new(size: size)

        (0...size).reverse_each do |i|
          ((i + 1)...size).each do |j|
            mutable_vector_y[i] -= matrix_u[i][j] * result[j]
          end

          result[i] =  mutable_vector_y[i] / matrix_u[i][i]
        end

        Vector.new(elements: result.elements)
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
