require_relative 'mutable_vector/initialize_elements'

module AdvancedMath
  class MutableVector < AbstractVector
    attr_reader :vector

    # TODO Extract methods
    def initialize(attrs_hash)
      @size     = attrs_hash[:size]
      @vector   = attrs_hash[:vector]
      @elements = initialize_elements(
        @vector,
        attrs_hash[:default_value]
      )
    end

    def size
      @size ||= vector.size
    end

    def []=(index, value)
      elements[index] = value
    end

    private
      def initialize_elements(matrix, default_value)
        if matrix
          InitializeElements.new(
            size: size,
            vector: matrix,
            default_value: default_value
          ).call
        else
          generate_default_elements(default_value)
        end
      end

      def generate_default_elements(default_value)
        Array.new(size) { default_value }
      end
  end
end
