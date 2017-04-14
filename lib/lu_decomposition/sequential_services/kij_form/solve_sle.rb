module LUDecomposition
  module SequentialServices
    module KIJForm
      # TODO Abstraction
      class SolveSLE < AbstractForm::SolveSLE
        def call
          decomposed_matrix = ConstructDecomposedMatrix.new(
            matrix: matrix,
            vector: vector
          ).call

          PerformBackSubstitution.new(
            decomposed_matrix: decomposed_matrix,
            vector: vector
          ).call
        end
      end
    end
  end
end
