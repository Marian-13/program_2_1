require_relative 'mutable_matrix/initialize_elements'

module AdvancedMath
  class MutableMatrix < AbstractMatrix
    attr_reader :row_size, :column_size, :elements, :matrix

    # TODO Extract methods
    def initialize(attrs)
      @row_size    = attrs[:row_size]
      @column_size = attrs[:column_size]
      @matrix      = attrs[:matrix]
      @elements    = initialize_elements(
        @matrix,
        attrs[:default_value]
      )
    end

    def row_size
      @row_size ||= matrix.row_size
    end

    def column_size
      @column_size ||= matrix.column_size
    end

    def [](index)
      elements[index]
    end

    def []=(index, value)
      elements[index] = value
    end

    def swap_rows!(first_index, second_index)
      elements[first_index], elements[second_index] =
        elements[second_index].clone, elements[first_index].clone

      # (0...column_size).each do |j|
      #   elements[first_index][j]  = elements[first_index][j] + elements[second_index][j]
      #   elements[second_index][j] = elements[first_index][j] - elements[second_index][j]
      #   elements[first_index][j]  = elements[first_index][j] - elements[second_index][j]
      # end
    end

    private
      def initialize_elements(matrix, default_value)
        if matrix
          InitializeElements.new(
            row_size: row_size,
            column_size: column_size,
            matrix: matrix,
            default_value: default_value
          ).call
        else
          generate_default_elements(default_value)
        end
      end

      def generate_default_elements(default_value)
        Array.new(row_size) { Array.new(column_size) { default_value } }
      end
  end
end
