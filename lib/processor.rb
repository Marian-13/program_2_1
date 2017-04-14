class Processor
  attr_reader :tasks, :amount, :thread

  def initialize(**attrs_hash, &block)
    @tasks  = attrs_hash[:tasks]
    @amount = attrs_hash[:amount]
    @thread = start_thread(block)
  end

  def start_thread(&block)
    Thread.new do
      performed_tasks_amount = 0

      loop do
        if tasks.empty? && performed_tasks_amount == amount
          break
        else
          block.call(tasks.shift)
        end
      end
    end
  end

  def stop_thread
    thread.terminate
  end
end
