module AdvancedMath
  module LUDecomposition
    module CyclicLayerScheme
      class GenerateProcessorsRowIndices < AbstractScheme::GenerateProcessorsRowIndices
        def call
          matrix_row_size = matrix.row_size

          row_indices_amount_per_processor = matrix_row_size / processors_amount

          processors_row_indices = Array.new(processors_amount) { Array.new }

          row_index = -1

          (0...processors_amount).each do |i|
            row_indices_amount_per_processor.times do |j|
              row_index += 1
              processors_row_indices[i][j] = row_index
            end
          end

          processors_row_indices
        end
      end
    end
  end
end
