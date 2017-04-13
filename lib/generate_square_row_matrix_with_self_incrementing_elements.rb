class GenerateSquareRowMatrixWithSelfIncrementingElements
  attr_reader :first_element, :size

  def initialize(attrs_hash)
    @first_element = attrs_hash[:first_element]
    @size          = attrs_hash[:size]
  end

  def call
    mutable_result = AdvancedMath::MutableMatrix.new(
      row_size: size,
      column_size: size
    )

    element = decrement_first_element

    (0...size).each do |i|
      (0...size).each do |j|
        element += 1
        mutable_result[i][j] = element
      end
    end

    SquareRowMatrix.new(rows: mutable_result.elements)
  end

  private
    def decrement_first_element
      first_element - 1
    end
end
