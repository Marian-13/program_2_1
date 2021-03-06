module AdvancedMath
  module LUDecomposition
    class ProcessorBasedOnInfiniteThreads
      attr_reader :row_indices, :tasks_amount, :queue, :thread

      def initialize(**attrs_hash, &block)
        @row_indices  = attrs_hash[:row_indices]
        @tasks_amount = attrs_hash[:tasks_amount]
        @queue  = Queue.new
        @thread = Thread.new do
          remaining_tasks_amount = tasks_amount

          loop do
            if queue.empty?
              # puts remaining_tasks_amount
              if remaining_tasks_amount == 0
                break
              else
                sleep
              end
            else
              queue.pop.call(row_indices)
              remaining_tasks_amount -= 1
            end
          end
        end
      end

      def add_task(&block)
        queue.push(block)
        thread.run
      end

      def wait
        loop do
          break unless active?
        end
      end

      def join
        thread.join
      end

      def terminate
        thread.terminate
      end

      def active?
        !thread.stop?
      end
    end
  end
end
