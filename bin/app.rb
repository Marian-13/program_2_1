require './lib/advanced_math'

include AdvancedMath

rows = [[-1, 1, 0], [0, 2, 1], [-1, 5, 3]]
row_matrix = RowMatrix.new(rows: rows)

# elements = [1, 5, 12]
# column_vector = ColumnVector.new(elements: elements)
#
mutable_matrix = MutableMatrix.new(matrix: row_matrix)
p mutable_matrix

mutable_matrix = MutableMatrix.new(row_size: 3, column_size: 3, matrix: row_matrix)
p mutable_matrix

mutable_matrix = MutableMatrix.new(row_size: 2, column_size: 2, matrix: row_matrix)
p mutable_matrix

mutable_matrix = MutableMatrix.new(row_size: 5, column_size: 3, matrix: row_matrix)
p mutable_matrix

mutable_matrix = MutableMatrix.new(row_size: 3, column_size: 5, matrix: row_matrix)
p mutable_matrix

mutable_matrix = MutableMatrix.new(row_size: 5, column_size: 5, matrix: row_matrix)
p mutable_matrix

# lu_decomposition = LUDecomposition.new(matrix: row_matrix, vector: column_vector)
# p lu_decomposition

# p.125; p.367.
