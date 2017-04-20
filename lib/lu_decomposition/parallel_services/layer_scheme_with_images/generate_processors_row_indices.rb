module LUDecomposition
  module ParallelServices
    module LayerSchemeWithImages
      class GenerateProcessorsRowIndices
        attr_reader :processors_amount, :matrix

        def initialize(attrs_hash)
          @processors_amount = attrs_hash[:processors_amount]
          @matrix            = attrs_hash[:matrix]
        end

        # TODO Remove duplication
        def call
          matrix_row_size = matrix.row_size

          row_indices_amount_per_processor = matrix_row_size / processors_amount

          processors_row_indices = Array.new(processors_amount) { Array.new }

          row_index = -1

          (0...processors_amount).each do |i|
            if i % 2 == 0
              row_indices_amount_per_processor.times do |j|
                row_index += 1
                processors_row_indices[i][j] = row_index
              end
            else
              (0...row_indices_amount_per_processor).reverse_each do |j|
                row_index += 1
                processors_row_indices[i][j] = row_index
              end
            end
          end

          processors_row_indices
        end
      end
    end
  end
end
