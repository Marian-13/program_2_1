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

    def solve_by_parallel_kij_form_of_lu_decomposition
      LUDecomposition::KIJForm::SolveSLEInParallel.new(
        matrix: matrix,
        vector: vector
      ).call
    end

    def solve_by_parallel_kji_form_of_lu_decomposition
      # TODO
    end
  end
end
