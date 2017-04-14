class GenerateSelfIncrementingMatrixElements
  attr_reader :first_element, :increment, :row_size, :column_size

  def initialize(attrs_hash)
    @first_element = attrs_hash[:first_element]
    @increment     = initialize_increment(attrs_hash[:increment])
    @row_size      = attrs_hash[:row_size]
    @column_size   = attrs_hash[:column_size]
  end

  def call
    elements = Array.new(row_size) { Array.new(column_size) }

    element = decrement_first_element

    (0...row_size).each do |i|
      (0...column_size).each do |j|
        element += increment
        elements[i][j] = element
      end
    end

    elements
  end

  private
    def initialize_increment(increment)
      increment || 1
    end

    def decrement_first_element
      first_element - increment
    end
end
