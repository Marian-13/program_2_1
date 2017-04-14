module LUDecomposition
  module ParallelServices
    class Processor
      attr_reader :rows

      def initialize(**attrs_hash)
        @rows = attrs_hash[:rows] || []
      end

      def push_row(row)
        rows.push(row)
      end

      def pop_row
        rows.pop
      end
    end
  end
end
