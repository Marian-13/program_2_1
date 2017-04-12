module AdvancedMath
  class SolveByKJIFormOfLUDecomposition
    attr_reader :row_matrix, :column_vector

    def initialize(attrs)
      @row_matrix    = attrs[:row_matrix]
      @column_vector = attrs[:column_vector]
    end

    # TODO Extract methods
    def call
      decomposed_matrix_row_size    = determine_decomposed_matrix_row_size
      decomposed_matrix_column_size = determine_decomposed_matrix_column_size


      result = MutableMatrix.new(
        row_size: decomposed_matrix_row_size,
        column_size: decomposed_matrix_row_size,
        matrix: row_matrix
      )

      (0...decomposed_matrix_row_size).each do |k|
        print "k = #{k};"

        ((k + 1)..decomposed_matrix_column_size).each do |j|
          print " j = #{j};"
          ((k + 1)..decomposed_matrix_row_size).each do |i|
            print " i = #{i}.\n"
            # print "k = #{k}; i = #{i}; j = #{j}.\n"
            # print "result[i][j] = #{result[i][j]}\n"
            # print "result[i][k] = #{result[i][k]}\n"
            # print "result[k][k] = #{result[k][k]}\n"
            # print "result[k][j] = #{result[k][j]}\n"

            result[i][j] -= (result[i][k] / result[k][k]) * result[k][j]
            # print "result[i][j] = #{result[i][j]}\n"
          end
        end
      end

      ColumnMatrix.new(columns: result.elements)
    end

    private
      def determine_decomposed_matrix_row_size
        row_matrix.row_size
      end

      def determine_decomposed_matrix_column_size
        row_matrix.column_size
      end

      def build_decomposed_matrix(row_size, column_size)

      end
  end
end
