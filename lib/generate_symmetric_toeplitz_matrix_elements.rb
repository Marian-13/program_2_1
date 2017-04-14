class GenerateSymmetricToeplitzMatrixElements
  attr_reader :first_row_elements, :size

  def initialize(attrs_hash)
    @first_row_elements = attrs_hash[:first_row_elements]
    @size               = initialize_size
  end

  def call
    elements = Array.new(size) { Array.new(size) }

    (0...size).each do |i|
      (i...size).each do |j|
        elements[i][j - i] = first_row_elements[j]
      end

      (0...i).each do |j|
        elements[i][size - i + j] = first_row_elements[j]
      end
    end

    elements
  end

  private
    def initialize_size
      first_row_elements.size
    end
end
