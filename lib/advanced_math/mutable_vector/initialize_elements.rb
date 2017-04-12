module AdvancedMath
  class MutableVector
    class InitializeElements
      attr_reader :size, :vector, :default_value

      def initialize(attrs)
        @size          = attrs[:size]
        @vector        = attrs[:vector]
        @default_value = attrs[:default_value]
      end

      # TODO Extract methods
      def call
        mutable_vector = MutableVector.new(size: size)

        if size <= vector.size
          (0...size).each { |i| mutable_vector[i] = vector[i] }
        else
          (0...vector.size).each { |i| mutable_vector[i] = vector[i] }
          (vector.size...size).each { |i| mutable_vector[i] = default_value }
        end

        mutable_vector.elements
      end
    end
  end
end
