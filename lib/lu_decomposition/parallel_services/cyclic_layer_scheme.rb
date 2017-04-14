module LUDecomposition
  module ParallelServices
    class CyclicLayerScheme
      DEFAULT_PROCESSORS_AMOUNT = 2

      attr_reader :matrix, :matrix_row_size, :processors_amount

      def initialize(attrs_hash)
        @matrix            = attrs_hash[:matrix]
        @matrix_row_size   = initialize_matrix_row_size
        @processors_amount = initialize_processors_amount(
          attrs_hash[:processors_amount]
        )
      end

      def start
        processors = []

        rows_per_processor_amount = matrix_row_size / processors_amount

        row_index = -1

        (0...processors_amount).each do |i|
          processors[i] = Processor.new

          rows_per_processor_amount.times do
            row_index += 1
            processors[i].push_row(matrix[row_index])
          end

          processors[i]
        end

        # (0...processors_amount).each do |i|
        p processors
      end

      private
        def initialize_processors_amount(processors_amount)
          processors_amount || DEFAULT_PROCESSORS_AMOUNT
        end

        def initialize_matrix_row_size
          matrix.row_size
        end
    end
  end
end
