module AdvancedMath
  module LUDecomposition
    module KIJForm
      class PerformBackSubstitution < AbstractForm::PerformBackSubstitution
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
      end
    end
  end
end
