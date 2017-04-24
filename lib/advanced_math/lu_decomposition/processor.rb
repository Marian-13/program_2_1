module AdvancedMath
  module LUDecomposition
    class Processor
      attr_reader :row_indices

      def initialize(**attrs_hash, &block)
        @row_indices = attrs_hash[:row_indices]
      end

      def add_task(&block)
        @thread = Thread.new { block.call(row_indices) }
      end

      def wait
        @thread.join
      end

      def join
        @thread.join
      end
    end
  end
end
