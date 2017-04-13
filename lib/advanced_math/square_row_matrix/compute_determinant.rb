module AdvancedMath
  class SquareRowMatrix < RowMatrix
    # TODO Refactor
    class ComputeDeterminant
      attr_reader :square_row_matrix, :size

      def initialize(attrs_hash)
        @square_row_matrix = attrs_hash[:square_row_matrix]
        @size              = initialize_size
      end

      def call
        compute_product_of_main_diagonal_elements -
          compute_sum_of_products_of_non_main_diagoanal_elements
      end

      private
        def initialize_size
          square_row_matrix.size
        end

        def compute_product_of_main_diagonal_elements
          product = 1

          (0...size).each do |i|
            product *= square_row_matrix[i][i]
          end

          product
        end

        def compute_break_index(index)
          size - index
        end

        def compute_product_of_non_main_diagonal_elements(index)
          break_index = compute_break_index(index)
          product = 1

          (0...break_index).each do |i|
            product *= square_row_matrix[i][i + index]
          end

          (break_index...size).each do |i|
            product *= square_row_matrix[i][i - break_index]
          end

          product
        end

        def compute_sum_of_products_of_non_main_diagoanal_elements
          sum = 0

          (1...size).each do |i|
            sum += compute_product_of_non_main_diagonal_elements(i)
          end

          sum
        end
    end
  end
end

#     |00 01 02|
# det(|10 11 12|) = 00 * 11 * 22 -(01 * 12 * 20 + 02 * 10 * 21)
#     |20 21 22|
