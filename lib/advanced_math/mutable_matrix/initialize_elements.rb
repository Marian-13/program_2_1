module AdvancedMath
  class MutableMatrix < AbstractMatrix
    class InitializeElements
      attr_reader :row_size, :column_size, :matrix, :default_value

      def initialize(attrs)
        @row_size      = attrs[:row_size]
        @column_size   = attrs[:column_size]
        @matrix        = attrs[:matrix]
        @default_value = attrs[:default_value]
      end

      # TODO Extract methods
      def call
        mutable_matrix = MutableMatrix.new(
          row_size: row_size,
          column_size: column_size,
        )

        if row_size <= matrix.row_size && column_size <= matrix.column_size
          (0...row_size).each do |i|
            (0...column_size).each do |j|
              mutable_matrix[i][j] = matrix[i][j]
            end
          end
        elsif row_size > matrix.row_size && column_size <= matrix.column_size
          (0...matrix.row_size).each do |i|
            (0...column_size).each do |j|
              mutable_matrix[i][j] = matrix[i][j]
            end
          end

          (matrix.row_size...row_size).each do |i|
            (0...column_size).each do |j|
              mutable_matrix[i][j] = default_value
            end
          end
        elsif row_size <= matrix.row_size && column_size > matrix.column_size
          (0...row_size).each do |i|
            (0...matrix.column_size).each do |j|
              mutable_matrix[i][j] = matrix[i][j]
            end
          end

          (0...row_size).each do |i|
            (matrix.column_size...column_size).each do |j|
              mutable_matrix[i][j] = default_value
            end
          end
        else
          (0...matrix.row_size).each do |i|
            (0...matrix.column_size).each do |j|
              mutable_matrix[i][j] = matrix[i][j]
            end
          end

          (matrix.row_size...row_size).each do |i|
            (matrix.column_size...column_size).each do |j|
              mutable_matrix[i][j] = default_value
            end
          end
        end

        mutable_matrix.elements
      end
    end
  end
end
