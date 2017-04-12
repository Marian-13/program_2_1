require './lib/advanced_math'

include AdvancedMath

# rows = [[-1, 1, 0], [0, 2, 1], [-1, 5, 3]]
# row_matrix = RowMatrix.new(rows: rows)
#
# columns = [[-1, 0, -1], [1, 2, 5], [0, 1, 3]]
# column_matrix = ColumnMatrix.new(columns: columns)

elements = [1, 5, 12]
row_vector = RowVector.new(elements: elements)

# lu_decomposition = LUDecomposition.new(matrix: column_matrix, vector: row_vector)
# p lu_decomposition.decomposed_matrix


p mutable_vector = MutableVector.new(size: 3)
p mutable_vector = MutableVector.new(vector: row_vector)
p mutable_vector = MutableVector.new(size: 5, vector: row_vector)

# column_vector = ColumnVector.new(elements: elements)
# p.125; p.367.
