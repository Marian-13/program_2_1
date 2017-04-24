module AdvancedMath
  class SLE
    attr_reader :matrix, :vector

    def initialize(attrs_hash)
      @matrix = attrs_hash[:matrix]
      @vector = attrs_hash[:vector]
    end

    def solve_by_kij_form_of_lu_decomposition
      LUDecomposition::KIJForm::SolveSLE.new(
        matrix: matrix,
        vector: vector
      ).call
    end

    def solve_by_kji_form_of_lu_decomposition
      # TODO
    end

    def solve_by_parallel_lu_kij_form_using_cyclic_layer_scheme(processors_amount)
      processors_row_indices =
        LUDecomposition::CyclicLayerScheme::GenerateProcessorsRowIndices.new(
          processors_amount: processors_amount,
          matrix: matrix
        ).call

      processors = Array.new(processors_amount)

      (0...processors_amount).each do |i|
        processors[i] = LUDecomposition::Processor.new(
          row_indices: processors_row_indices[i]
        )
      end

      # LUDecomposition::KIJForm::SolveSLEInParallel.new(
      #   matrix: matrix,
      #   vector: vector,
      #   processors_amount: processors_amount,
      #   processors: processors
      # ).call

      LUDecomposition::KIJForm::ConstructDecomposedMatrixInParallel.new(
        matrix: matrix,
        vector: vector,
        processors_amount: processors_amount,
        processors: processors
      ).call
    end

    def solve_by_parallel_lu_kij_form_using_cyclic_layer_scheme_2(processors_amount)
      processors_row_indices =
        LUDecomposition::CyclicLayerScheme::GenerateProcessorsRowIndices.new(
          processors_amount: processors_amount,
          matrix: matrix
        ).call

      processors = Array.new(processors_amount)

      (0...processors_amount).each do |i|
        processors[i] = LUDecomposition::ProcessorBasedOnInfiniteThreads.new(
          row_indices: processors_row_indices[i],
          tasks_amount: matrix.row_size - 1
        )
      end

      # LUDecomposition::KIJForm::SolveSLEInParallel.new(
      #   matrix: matrix,
      #   vector: vector,
      #   processors_amount: processors_amount,
      #   processors: processors
      # ).call

      LUDecomposition::KIJForm::ConstructDecomposedMatrixInParallel.new(
        matrix: matrix,
        vector: vector,
        processors_amount: processors_amount,
        processors: processors
      ).call
    end


    def solve_by_parallel_kji_form_of_lu_decomposition
      # TODO
    end
  end
end
