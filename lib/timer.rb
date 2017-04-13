class Timer
  attr_reader :start_time, :finish_time, :execution_time

  def initialize(&block)
    @start_time = initialize_start_time

    block.call

    @finish_time    = initialize_finish_time
    @execution_time = initialize_execution_time
  end

  private
    def initialize_start_time
      Time.now
    end

    def initialize_finish_time
      Time.now
    end

    def initialize_execution_time
      finish_time - start_time
    end
end
